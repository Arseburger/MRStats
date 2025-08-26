import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        
        ZStack(alignment: .center) {
            Color(.mrYellow).ignoresSafeArea()
            
            Text("MRStats")
                .font(CustomFonts.getFont(size: 32))
                .foregroundStyle(.mrDarkBlue)
        }
    }
}
