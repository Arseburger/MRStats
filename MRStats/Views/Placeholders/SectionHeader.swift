import SwiftUI

struct SectionHeader: View {
    var title: String
    var color: Color = .mrYellow
    
    var body: some View {
        Text(title)
            .font(CustomFonts.getFont(.main, size: 20))
            .foregroundStyle(.mrDarkBlue)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 36)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color)
                    .clipped(antialiased: true)
            }
            .padding(4)
    }
}
