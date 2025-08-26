import SwiftUI

struct RecentMapCell: View {
    var map: MapStats
    var mapImage: String {
        guard var mapImageUrl = map.thumbnail else { return "" }
        mapImageUrl.replace("maps/", with: "maps/large/")
        return mapImageUrl
    }
    
    var body: some View {
        VStack {
            MRImage(urlString: mapImage, type: .map)
                .scaledToFit()
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.mrDarkBlue.opacity(0.5))
                }
                .itemBordered(color: .clear, radius: 14, width: 1)
            
            HStack(spacing: 20) {
                StatsCell(title: "P", value: "\(map.matches)")
                StatsCell(title: "W", value: "\(map.wins)")
                StatsCell(title: "K", value: "\(map.kills)")
                StatsCell(title: "D", value: "\(map.deaths)")
                StatsCell(title: "A", value: "\(map.assists)")
                StatsCell(title: "Time", value: "\(map.stringTime)")
            }
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity)
            .itemBordered(color: .secondary, radius: 15, width: 2)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.mrDarkBlue.opacity(0.5))
            }
        }
        .padding(.horizontal, 8)
    }
}
