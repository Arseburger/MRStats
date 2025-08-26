import SwiftUI
    
struct TeamMatesView: View {
    let teamMates: [TeamMate]
    private let rows: [GridItem] = [.init(.fixed(80)), .init(.fixed(80))]
        
    var body: some View {
        VStack(spacing: 8) {
            SectionHeader(title: "Most played with")
            
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .center, spacing: 0) {
                    ForEach(teamMates.sorted { $0.matches > $1.matches }) { teamMate in
                        TeamMateCell(teamMate: teamMate)
                            .padding(.horizontal, 8)
                    }
                }
            }
            .padding(8)
            .background {
                Color(.mrDarkBlue.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .materialShadowed()
        .padding(.horizontal)
    }
}
