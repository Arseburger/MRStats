import SwiftUI

struct GameModeView: View {
    @State var stats: OverallStats
    @Binding var gameMode: GameMode
    
    var body: some View {
        if let gm = stats.gameMode(for: gameMode) {
            Text(gameMode.rawValue)
                .bold()
                .foregroundStyle(.mrDarkBlue)
                .padding(.horizontal)
                .frame(width: 120)
                .background(Capsule().fill(.mrYellow))
                .padding(.bottom, 4)
            
            VStack(alignment: .leading) {
                Text("Time played: \(gm.totalTimePlayed)")
                Text("Matches played: \(gm.totalMatches)")
                Text("Matches won: \(gm.totalWins)")
                
                HStack(spacing: 20) {
                    StatsCell(title: "Kills", value: "\(gm.totalKills)")
                    StatsCell(title: "Deaths", value: "\(gm.totalDeaths)")
                    StatsCell(title: "Assists", value: "\(gm.totalAssists)")
                    
                    if gm.totalMvp > 0 { StatsCell(title: "MVP", value: "\(gm.totalMvp)") }
                    if gm.totalSvp > 0 { StatsCell(title: "SVP", value: "\(gm.totalSvp)") }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
