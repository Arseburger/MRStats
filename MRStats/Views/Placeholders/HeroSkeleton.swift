import SwiftUI

struct HeroSkeleton: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            SkeletonView(RoundedRectangle(cornerRadius: 4))
                .frame(idealHeight: 180)
            
            VStack(spacing: 4) {
                SkeletonView(RoundedRectangle(cornerRadius: 4))
                    .frame(width: 128, height: 22)
                    .padding(.top, 6)
                
                VStack(alignment: .leading, spacing: 4) {
                    SkeletonView(RoundedRectangle(cornerRadius: 4))
                        .frame(width: 96, height: 14)
                    SkeletonView(RoundedRectangle(cornerRadius: 4))
                        .frame(width: 112, height: 14)
                    SkeletonView(RoundedRectangle(cornerRadius: 4))
                        .frame(width: 144, height: 14)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .bottom], 8)
                
            }
            .background(.mrDarkBlue)
        }
        .itemBordered(color: .mrYellow, radius: 16, width: 4)
    }
}
