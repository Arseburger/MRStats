import Foundation
import SwiftUI

final class PlayerViewModel: ObservableObject, MRViewModel {
    private let id: String
    
    @Published var didPressUpdate: Bool = false
    @Published var selectedSeason: String = ""
    
    @Published var player: PlayerResponse?
    @Published var isLoading: Bool = false
    
    // MARK: MRViewModel -
    @Published var banner: Banner? {
        didSet { disableBanner(3) }
    }
    
    private weak var cooldownManager: CooldownManager? = DI.shared.cooldownManager
    private weak var service: PlayersService? = DI.shared.playersService
    
    var isUpdating: Bool {
        guard let cdm = cooldownManager else { return false }
        return cdm.isCooling(self.id)
    }
    
    func lastUpdate() -> String? {
        guard let lastUpdate = player?.updates?.lastUpdateRequest else { return nil }
        return lastUpdate
    }
    
    @MainActor
    func loadPlayer(season: String = "") {
        isLoading = true
        Task {
            let result = await service?.load(player: self.id, season: getSeason(season) ?? "")
            switch result {
            case .success(let player):
                self.player = player
                isLoading = false
                selectedSeason = season
            default: break
            }
        }
    }

    @MainActor
    func updatePlayer() {
        Task {
            guard let service, let cdm = cooldownManager else { return }
            if !isUpdating {
                let updateResult = await service.update(player: "\(id)")
                switch updateResult {
                case .success(let res):
                    self.banner = .init(message: res.message ?? "Update completed")
                    cdm.recordUpdate(for: self.id)
                case .failure(let error):
                    self.banner = .init(message: error.localizedDescription)
                }
            }
        }
    }
        
    fileprivate func getSeason(_ season: String) -> String? {
        guard !season.isEmpty, let number = Double(season.suffix(2)) else { return nil }
        let newSeason = "\(number == 1.0 ? "0" : "\(number * 0.5)")"
        return newSeason.contains(".0") ? String(newSeason.dropLast(2)) : newSeason
    }
    
    @MainActor
    init(id: String) {
        self.id = id
        Task { [weak self] in
            self?.loadPlayer()
        }
        
    }
}
