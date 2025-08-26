import SwiftUI

struct RecentMapsView: View {
    var maps: [MapStats] = []
    private let rows: [GridItem] = [.init(.fixed(120))]
    
    var body: some View {
        VStack(spacing: 8) {
            SectionHeader(title: "Stats by Map")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(maps.sorted { $0.playTime > $1.playTime }) { map in
                        RecentMapCell(map: map)
                    }
                }
            }
            .padding(8)
        }
        .materialShadowed()
        .padding(.horizontal)
    }
}
