import SwiftUI

struct HeroInfoView: View {
    @EnvironmentObject var viewModel: HeroViewModel
    
    var body: some View {
        Group {
            let hero = viewModel.hero
            
            MRImage(urlString: viewModel.selectedTransformation?.icon ?? hero.iconURL, type: .hero)
                .aspectRatio(contentMode: .fit)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 64))
                .background {
                    RoundedRectangle(cornerRadius: 64)
                        .fill(.clear).stroke(.white)
                }
                .shadow(color: hero.role.color, radius: 160, x: 4, y: 4)
            
            VStack {
                Text(viewModel.selectedTransformation?.name ?? hero.name)
                    .font(CustomFonts.getFont(.main, size: 40))
                    .foregroundStyle(.mrYellow)
                    .padding(.top, 8)
                
                Text(hero.role.rawValue)
                    .font(CustomFonts.getFont(.main, size: 20))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Real Name: \(hero.realName)")
                    Text("Type: \(hero.attackType)")
                    Text(viewModel.teamsList)
                }
                .font(CustomFonts.getFont(.main, size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
                .padding(.horizontal, 16)
                
                Button {
                    viewModel.isShowingBio = true
                } label: {
                    Text("Read bio")
                        .font(CustomFonts.getFont(size: 20))
                        .foregroundStyle(.mrDarkBlue)
                        .frame(width: 160, height: 40, alignment: .center)
                        .background(.mrYellow)
                        .clipShape(.rect(cornerRadius: 20))
                        .padding(.bottom, 8)
                }
                
                .sheet(isPresented: $viewModel.isShowingBio) {
                    HeroBioView()
                }
            }
            .foregroundStyle(.white)
        }
        .onChange(of: viewModel.selectedTransformation) { _, transformation in
            viewModel.selectedTransformation = transformation
        }
        .toolbarBackground(.mrDarkBlue, for: .navigationBar)
    }
}
