import SwiftUI

struct PlayerStatsView: View {
    var stats: OverallStats
    @State var isRanked: Bool = false
    @State var gameMode: GameMode = .unranked
    
    var body: some View {
        VStack {
            SectionHeader(title: "Seasonal Stats")
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Total:")
                    Text("\(stats.totalMatches) Matches")
                    Text("\(stats.totalWins) Wins")
                }
                
                Spacer()
                
                VStack {
                    Text("Ranked:")
                        .font(CustomFonts.getFont())
                    Toggle("", isOn: $isRanked)
                        .labelsHidden()
                }
            }
            .padding([.horizontal, .top])
            
            GameModeView(stats: stats, gameMode: $gameMode)
                .padding(.horizontal)
        }
        .foregroundStyle(.white)
        .materialShadowed()
        .padding(.horizontal)
        
        .onChange(of: isRanked) { _, newValue in
            gameMode = newValue ? .ranked : .unranked
        }
    }
}
