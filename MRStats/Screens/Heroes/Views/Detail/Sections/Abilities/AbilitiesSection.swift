import SwiftUI

struct AbilitiesSection: View {
    @EnvironmentObject var viewModel: HeroViewModel
    
    var body: some View {
        VStack(spacing: 4) {
            SectionHeader(title: "Abilities")
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(150))], spacing: 4) {
                    ForEach(viewModel.filteredAbilities) { ability in
                        AbilityCell(ability: ability)
                            .onTapGesture {
                                viewModel.selectedAbility = ability
                                viewModel.isShowingAbilityInfo = true
                            }
                    }
                }
            }
        }
        .materialShadowed()
        .padding(.horizontal)
    }
}
