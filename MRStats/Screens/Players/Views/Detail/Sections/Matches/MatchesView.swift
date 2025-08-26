import SwiftUI
    
struct MatchesView: View {
    @State var matches: [Match]
    var body: some View {
        ScrollView(.horizontal) {
            ForEach(matches) { match in
                MatchCell(match: match)
            }
        }
    }
}
