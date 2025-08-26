import SwiftUI

struct CostumeCell: View {
    var costume: Costume
    
    var body: some View {
        if let icon = costume.icon {
            VStack(alignment: .center, spacing: 0) {
                MRImage(urlString: icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding([.top, .horizontal], 8)
                
                Text(costume.name)
                    .font(CustomFonts.getFont(.main, size: 24))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, idealHeight: 48)
                    .background(.mrDarkBlue)
                    .padding(.vertical, 4)
                
            }
            .itemBordered(
                color: Quality(rawValue: costume.quality)!.color,
                radius: 32, width: 4
            )
            .padding(.horizontal)
        }
    }
}
