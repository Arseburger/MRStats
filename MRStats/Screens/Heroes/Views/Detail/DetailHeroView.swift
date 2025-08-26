import SwiftUI

struct DetailHeroView: View {
    @EnvironmentObject var viewModel: HeroViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 8) {
                    HeroInfoView()
                        .environmentObject(viewModel)
                    
                    Group {
                        if viewModel.hasMultipleTransformation {
                            TransformationSection()
                        }
                        
                        if !viewModel.filteredAbilities.isEmpty {
                            AbilitiesSection()
                        }
                        
                        CostumesSection(costumes: viewModel.costumes)
                    }
                    .padding(.vertical, 12)
                }
                .background(.mrDarkBlue)
            }
            .navigationBarTitleDisplayMode(.inline)
            .hideable($viewModel.isShowingAbilityInfo)
            
            if viewModel.isShowingAbilityInfo {
                DetailAbilityView()
                    .padding(.horizontal)
                    .frame(maxHeight: 600)
            }
        }
        .scrollIndicators(.hidden)
        .background(.mrDarkBlue)
    }
}
