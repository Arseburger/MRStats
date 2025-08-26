import SwiftUI

struct PlayerMainView: View {
    @State var player: Player
    
    var body: some View {
        HStack(spacing: 24) {
            if let icon = player.icon?.playerIcon {
                MRImage(urlString: icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 16))
                    .itemBordered(color: .white, radius: 16, width: 2)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(player.name ?? "")
                    .font(CustomFonts.getFont(size: 24))
                    .foregroundStyle(.mrYellow)
                
                HStack(spacing: 0) {
                    Text(player.rank?.rank ?? "")
                        .font(CustomFonts.getFont())
                        .foregroundStyle(Color(hex: player.rank?.color ?? "#FFFFFF"))
                    
                    if let image = player.rank?.image {
                        MRImage(urlString: image)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 36)
                    }
                }
                Text("Level: \(player.level ?? "Unknown")")
            }
            .italic()
            .foregroundStyle(.mrDarkBlue)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.2))
        }
    }
}
