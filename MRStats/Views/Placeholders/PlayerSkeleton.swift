import SwiftUI

struct PlayerSkeleton: View {
    @State var isLoading: Bool
    
    var body: some View {
        if isLoading {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 4) {
                    createSection(withHeader: false)
                        .frame(height: 180)
                    createSection(withHeader: true)
                        .frame(height: 200)
                    createSection(withHeader: true)
                        .frame(height: 320)
                    createSection(withHeader: true)
                        .frame(height: 240)
                    SkeletonView(RoundedRectangle(cornerRadius: 4))
                        .frame(width: 240, height: 16)
                }
                .padding(.bottom, 4)
            }
            .background {
                Color.mrDarkBlue.opacity(0.95)
                    .ignoresSafeArea()
            }
        }
    }
    
    @ViewBuilder
    func createSection(withHeader: Bool) -> some View {
        ZStack {
            VStack {
                if withHeader {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.mrYellow)
                        .frame(height: 36)
                        .padding([.top, .horizontal], 4)
                }
                SkeletonView(RoundedRectangle(cornerRadius: 14))
                    .padding(withHeader ? [.horizontal, .bottom] : .all, 4)
                
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.mrDarkBlue)
        }
        .padding(.horizontal)
    }
}
