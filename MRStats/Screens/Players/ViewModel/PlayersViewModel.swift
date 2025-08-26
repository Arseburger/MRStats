import SwiftUI

final class PlayersViewModel: ObservableObject, BannerDelegate, MRViewModel {
    
    // MARK: Persistence -
    @Published private(set) var historyStore = DI.shared.searchHistoryStore
    @Published var shortPlayers: [SearchQuery] = []
    
    // MARK: MRSearchBarDelegate -
    @Published private var searchText: String = ""
    @Published private(set) var isLoading: Bool = false
    
    // MARK: MRViewModel -
    @Published var banner: Banner? = nil {
        didSet { disableBanner() }
    }
    
    private weak var service: PlayersService? = DI.shared.playersService
    
    init() {
        shortPlayers += historyStore.history
    }
}

// MARK: MRSearchBarDelegate -
extension PlayersViewModel: MRSearchBarDelegate {
    @MainActor
    func searchBar(didSubmit text: String) async {
        guard !text.isEmpty else { return }
        isLoading = true
        let result = await self.service?.find(player: text)
        switch result {
        case .success(let player):
            guard player.name != nil && player.id != nil else {
                self.banner = .init(message: player.message ?? "Unknown Error")
                isLoading = false
                return
            }
            self.historyStore.add(player)
            self.shortPlayers += [player]
            isLoading = false
        default: break
        }
    }
}
