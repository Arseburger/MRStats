import SwiftUI

struct CostumesSection: View {
    var costumes: [Costume]
    var body: some View {
        VStack(spacing: 4) {
            SectionHeader(title: "Costumes")
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())]) {
                    ForEach(costumes) { costume in
                        CostumeCell(costume: costume)
                    }
                }
            }
        }
        .materialShadowed()
        .padding([.horizontal, .bottom])
    }
}
