import SwiftUI

struct MapSkeleton: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            SkeletonView(Rectangle())
                .itemBordered(color: .white, radius: 7.5, width: 2)
                .frame(height: 150)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal)
            
            SkeletonView(RoundedRectangle(cornerRadius: 4))
                .frame(width: 150, height: 24)
            
            SkeletonView(RoundedRectangle(cornerRadius: 4))
                .frame(width: 200, height: 18)
            
            HStack(alignment: .top) {
                SkeletonView(RoundedRectangle(cornerRadius: 4))
                    .frame(width: 144, height: 22)
                
                Spacer()
                
                SkeletonView(RoundedRectangle(cornerRadius: 8))
                    .frame(width: 120, height: 32)
            }
            .padding(.horizontal, 0)
            .frame(height: 32)
            
        }
        .padding()
        .background { RoundedRectangle(cornerRadius: 20).fill(.mrDarkBlue) }
    }
}
