import SwiftUI

struct MatchCell: View {
    let match: Match
    
    var body: some View {
        ZStack(alignment: .center) {
            MRImage(urlString: match.mapThumbnail ?? "", type: .map)
                .aspectRatio(contentMode: .fit)
            VStack {
                HStack {
                    Text(String(match.winnerSide ?? 0))
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                        .background(Circle().fill(Color.red))
                }
                PerformanceView()
            }
        }
    }
}
