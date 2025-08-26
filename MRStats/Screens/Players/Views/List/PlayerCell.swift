import SwiftUI

struct PlayerCell: View {
    
    var name: String
    var id: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(CustomFonts.getFont(size: 20))
                    .foregroundStyle(.mrYellow)
                Text(id)
                    .font(.subheadline)
                    .fontDesign(.rounded)
                    .foregroundStyle(.white.opacity(0.4))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white.opacity(0.4))
                .frame(width: 12, height: 12)
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.mrDarkBlue)
        }
        .materialShadowed()
        .padding(.horizontal)
        
    }
}
