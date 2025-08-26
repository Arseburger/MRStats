import SwiftUI

struct HeroCell: View {
    private var hero: Hero
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            MRImage(urlString: hero.iconURL)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, idealHeight: 180)
            
            VStack {
                Text(hero.name.capitalized)
                    .font(CustomFonts.getFont(size: 24))
                    .foregroundColor(hero.role.color)
                    .frame(maxWidth: .infinity)
                    .padding([.top, .horizontal], 4)
                
                VStack(alignment: .leading) {
                    Text("Role: \(hero.role.rawValue)")
                    Text("Difficulty: \(hero.difficulty) / 5")
                    Text("Type: \(hero.attackType)")
                }
                .padding([.leading, .bottom], 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .font(CustomFonts.getFont(size: 16))
            .foregroundStyle(.white)
            .background(.mrDarkBlue)
        }
        .itemBordered(color: .mrYellow, radius: 16, width: 4)
    }
    
    init(_ hero: Hero) {
        self.hero = hero
    }
}
