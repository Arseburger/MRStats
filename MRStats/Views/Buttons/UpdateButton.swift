import SwiftUI

struct UpdateButton: View {
    var body: some View {
        Image(systemName: "arrow.trianglehead.clockwise")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .tint(.mrDarkBlue)
            .frame(width: 40, height: 40, alignment: .center)
            .offset(y: -1.5)
            .padding(8)
            .background {
                Circle()
                    .fill(.mrYellow)
                    .materialShadowed(radius: 28)
            }
    }
}
