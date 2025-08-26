import SwiftUI

struct HeroBioView: View {
    @EnvironmentObject var viewModel: HeroViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(viewModel.hero.realName)
                    .font(CustomFonts.getFont(size: 32))
                    .foregroundStyle(.mrYellow)
                Spacer()
                
                Button {
                    viewModel.isShowingBio = false
                } label: { HideBioButton() }
            }
            .padding(.top, 20)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Bio:")
                        .font(CustomFonts.getFont(size: 24))
                        .padding(.bottom, 4)
                    Text(viewModel.hero.bio)
                        .padding(.bottom, 8)
                    Text("Lore:")
                        .font(CustomFonts.getFont(size: 24))
                        .padding(.bottom, 4)
                    Text(viewModel.hero.lore)
                }
            }
            .font(.system(size: 16))
            .foregroundStyle(.white)
        }
        .padding(.horizontal, 16)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.mrDarkBlue)
    }
}
