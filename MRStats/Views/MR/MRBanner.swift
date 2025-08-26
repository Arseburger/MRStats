import SwiftUI

struct MRBanner: View {
    let banner: Banner
    let type: BannerType
    
    var body: some View {
        Text(banner.message)
            .font(.system(size: 14)).bold()
            .foregroundStyle(.white.opacity(0.5))
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .padding(.horizontal, 12)
            .multilineTextAlignment(.center)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.mrDarkBlue))
                    .itemBordered(
                        color: type.color(),
                        radius: 16,
                        width: 2
                    )
            }
            .padding(.horizontal, 16)
    }
}
