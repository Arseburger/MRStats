import SwiftUI

struct TransformationSection: View {
    @EnvironmentObject var viewModel: HeroViewModel
    
    var body: some View {
        LazyHGrid(
            rows: [GridItem(.flexible())],
            alignment: .center
        ) {
            ForEach(viewModel.hero.transformations) { transformation in
                TransformationCell(item: transformation)
                    .itemBordered(
                        color: transformation.id == viewModel.selectedTransformation?.id ? .mrYellow : .white,
                        radius: 15,
                        width: 2)
                    
                    .onTapGesture {
                        withAnimation(.default) {
                            viewModel.selectedTransformation = transformation
                        }
                    }
            }
        }
        .onAppear {
            let transformation = viewModel.hero.transformations.first
            viewModel.selectedTransformation = transformation
        }
        
    }
}
