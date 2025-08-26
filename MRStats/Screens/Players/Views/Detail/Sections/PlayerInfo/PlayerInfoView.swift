import SwiftUI

struct PlayerInfoView: View {
    @State var player: Player
    @Binding var selectedSeason: String
    
    var body: some View {
        VStack(spacing: 4) {
            PlayerMainView(player: player)
                .padding([.horizontal, .top], 4)
            
            if let info = player.info {
                SeasonsView(info: info, selectedSeason: $selectedSeason)
            }
        }
        .materialShadowed()
        .padding(.horizontal)
    }
}
