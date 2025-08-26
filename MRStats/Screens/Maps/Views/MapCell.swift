import SwiftUI

struct MapCell: View {
    let map: Map
    @State var isShowingDescription: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            MRImage(urlString: String(map.images[2]), type: .map)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .padding(.horizontal, 0)
                .itemBordered(
                    color: .white,
                    radius: 8,
                    width: 2
                )
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(map.name)
                        .font(CustomFonts.getFont(size: 24))
                        .minimumScaleFactor(0.6)
                    Spacer()
                    
                    Text(map.gameMode)
                        .font(CustomFonts.getFont(size: 24))
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(.mrYellow)
                }
                Text(map.location)
                    .font(CustomFonts.getFont(size: 18))
                    .minimumScaleFactor(0.6)
                    .foregroundStyle(.white.opacity(0.4))
            }
            .padding(.horizontal, 8)
            
            if let description = map.description, isShowingDescription {
                descriptionView(description)
            }
        }
        .foregroundStyle(.white)
        .padding(8)
        .background {
            Color.clear
        }
        .materialShadowed()
        .padding(.horizontal)
        .onTapGesture {
            if map.description != nil {
                withAnimation(.smooth(duration: 0.3)) {
                    isShowingDescription.toggle()
                }
            }
        }
    }
    
    @ViewBuilder
    func descriptionView(_ description: String) -> some View {
        VStack(alignment: .center) {
            Color(.mrYellow)
                .frame(height: 1)
            Text(description)
                .font(CustomFonts.getFont())
                .fontDesign(.monospaced)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 8)
    }
}
