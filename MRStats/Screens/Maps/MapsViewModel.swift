import Foundation
import SwiftUI

final class MapsViewModel: ObservableObject {
    
    @Published var maps: [Map] = []
    @Published var isLoading: Bool = false
    private weak var service: MapsService? = DI.shared.mapsService
    
    var mapsCount: Int { filteredMaps.count }
    
    var filteredMaps: [Map] {
        var _maps = Set<Int>()
        return maps.compactMap {
            _maps.insert($0.id).inserted ? $0 : nil
        }.filter { !$0.name.isEmpty }.sorted { $0.gameMode < $1.gameMode }
    }
    
    @MainActor
    func loadMaps() {
        Task {
            isLoading = true
            let result = await self.service?.loadMaps(limit: 50)
            switch result {
            case .success(let response):
                self.maps = response.maps
                    .uniqued(by: { map in
                        [
                            map.name,
                            map.fullName,
                            map.location,
                            map.gameMode,
                            String(map.subMap.id ?? 0),
                            map.video ?? ""
                        ].joined(separator: "|")
                    })
                isLoading = false
            default: break
            }
        }
    }    
}
