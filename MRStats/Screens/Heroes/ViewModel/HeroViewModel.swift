import SwiftUI

final class HeroViewModel: ObservableObject {
    @Published var hero: Hero
    
    @Published var selectedTransformation: Transformation?
    @Published var selectedAbility: Ability?
    
    @Published var isShowingBio: Bool = false
    @Published var isShowingAbilityInfo: Bool = false
    
    var costumes: [Costume] {
        return hero.costumes ?? []
    }
    
    var filteredAbilities: [Ability] {
        return hero.abilities.filter {
            $0.transformationId == selectedTransformation?.id
        }.sorted {
            $0.type!.value > $1.type!.value
        }
    }
    
    var teamsList: String {
        hero.team.count > 1
        ? "Teams: \(hero.team.map { $0 }.joined(separator: ", "))"
        : "Team: \(hero.team.first ?? "No team")"
    }
    
    var hasMultipleTransformation: Bool {
        hero.transformations.count > 1
    }
    
    init(hero: Hero) {
        self.hero = hero
        self.selectedTransformation = hero.transformations.first
    }
}
