import SwiftUI

struct HideBioButton: View {
    var body: some View {
        Text("Hide bio")
            .font(CustomFonts.getFont())
            .foregroundStyle(.mrDarkBlue)
            .frame(width: 96, height: 32, alignment: .center)
            .background(.mrYellow)
            .clipShape(.rect(cornerRadius: 20))
            .padding(.bottom, 8)
    }
}
