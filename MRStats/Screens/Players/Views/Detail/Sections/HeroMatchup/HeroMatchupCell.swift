import SwiftUI

struct HeroMatchupCell: View {
    let matchup: HeroMatchup
    
    var body: some View {
        VStack(spacing: 12) {
            if let image = matchup.heroThumbnail {
                MRImage(urlString: image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .itemBordered(
                        color: matchup.heroClass?.color ?? .gray,
                        radius: 15, width: 2
                    )
            }
            if let name = matchup.heroName {
                Text(name.capitalized)
                    .font(CustomFonts.getFont(size: 20))
                    .foregroundStyle(.white)
            }
            
            if
                let p = matchup.matches,
                let w = matchup.wins,
                let wr = matchup.winRate
            {
                HStack {
                    StatsCell(title: "Played", value: String(p))
                    StatsCell(title: "Won", value: String(w))
                    Spacer()
                    StatsCell(title: "Win Rate", value: String(wr))
                }
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        }
        
    }
}
