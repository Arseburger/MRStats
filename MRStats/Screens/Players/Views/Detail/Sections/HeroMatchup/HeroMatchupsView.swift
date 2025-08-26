import SwiftUI

struct HeroMatchupsView: View {
    let matchups: [HeroMatchup]
    private let rows: [GridItem] = [.init(.fixed(150), spacing: 0)]
    
    var body: some View {
        VStack(spacing: 8) {
            SectionHeader(title: "Matchups")
            
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 4) {
                    ForEach(matchups.sorted { $0.matches! > $1.matches! }) { matchup in
                        HeroMatchupCell(matchup: matchup)
                    }
                }
            }
            .frame(height: 216)
            .padding(4)
        }
        .materialShadowed()
        .padding(.horizontal)
    }
}
