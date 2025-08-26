import SwiftUI

struct SeasconCell: View {
    let season: String
    var seasonName: String
    
    var body: some View {
        Text(seasonName)
            .foregroundStyle(.white)
            .padding(6)
            .background(RoundedRectangle(cornerRadius: 8).fill(.mrDarkBlue))
    }
    
    init?(season: String) {
        guard let number = Double(season.suffix(2)) else { return nil }
        self.seasonName = "\(number == 1.0 ? "0" : "\(number * 0.5)")"
        self.season = season
    }
}
