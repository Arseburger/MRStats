import SwiftUI

struct AbilityCell: View {
    var ability: Ability
    private var color: Color {
        ability.type?.getColor() ?? .clear
    }
    
    var body: some View {
        VStack(alignment: .center) {
            MRImage(urlString: ability.icon!)
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .colorMultiply(color)
            Text(ability.name ?? "No Name")
                .font(CustomFonts.getFont())
                .foregroundStyle(color)
        }
        .padding()
        .itemBordered(color: color, radius: 12, width: 2)
        .padding(.horizontal, 4)
    }
}
