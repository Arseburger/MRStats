import SwiftUI

struct DescriptionButton: View {
    @Binding var isShowingDescription: Bool
    
    var body: some View {
        Button {
            withAnimation(.easeIn) {
                isShowingDescription.toggle()
            }
        } label: {
            HStack(spacing: 4) {
                Text("Description")
                    .font(CustomFonts.getFont())
                    .foregroundStyle(.mrDarkBlue)
                    .padding(4)
                
                Image(systemName: isShowingDescription ? "arrowtriangle.up" : "arrowtriangle.down")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.mrDarkBlue)
            }
            .padding(.horizontal, 4)
            .background(isShowingDescription ? .gray : .mrYellow)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
