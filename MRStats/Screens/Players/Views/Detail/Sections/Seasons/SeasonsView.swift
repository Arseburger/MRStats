import SwiftUI

struct SeasonsView: View {
    let info: Info
    @Binding var selectedSeason: String
    
    var body: some View {
        HStack {
            Text("Season:")
                .font(CustomFonts.getFont(size: 18))
                .foregroundStyle(.mrYellow)
            
            ForEach(info.rankGameSeason.keys.sorted { $0 > $1 }, id: \.self) { season in
                SeasconCell(season: season)
                    .itemBordered(
                        color: selectedSeason == season ? .mrYellow : .gray.opacity(0.6),
                        radius: 8,
                        width: 2
                    )
                    .onTapGesture { selectedSeason = season }
            }
        }
        .frame(height: 48)
    }
}
