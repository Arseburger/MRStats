import SwiftUI

struct TeamMateCell: View {
    @State var teamMate: TeamMate
    
    var body: some View {
        HStack(alignment: .center) {
            MRImage(urlString: String(teamMate.playerInfo.playerIcon.dropFirst(7)))
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(teamMate.playerInfo.nickname)
                    .font(CustomFonts.getFont())
                    .foregroundStyle(.mrYellow)
                
                Text("Played: \(teamMate.matches)\nWinrate: \(teamMate.winRate)%")
                    .font(.caption)
                    .foregroundStyle(.white)
            }
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: 240)
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        }
    }
}
