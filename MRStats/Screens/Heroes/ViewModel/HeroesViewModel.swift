import SwiftUI

final class HeroesViewModel: ObservableObject {
    
    @Published var heroes: [Hero] = []
    @Published var sorting: Sorting = .none
    @Published var isShowingSortingOptions: Bool = false
    @Published var isLoading: Bool = false
        
    private weak var service: HeroesService? = DI.shared.heroesService

    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 180), spacing: 8, alignment: .center),
        GridItem(.flexible(minimum: 180), spacing: 8, alignment: .center),
    ]
    
    var sortedHeroes: [Hero] {
        return heroes.sorted(by: sorting.rule)
    }
    
    @MainActor
    func loadHeroes() {
        isLoading = true
        Task {
            let response = await self.service?.getHeroes()
            switch response {
            case .success(let heroes):
                self.heroes = heroes
                isLoading = false
            case .failure(let error):
                if let error = error as? MRError {
                    print(error.description)
                }
            default: break
            }
        }
    }
}
