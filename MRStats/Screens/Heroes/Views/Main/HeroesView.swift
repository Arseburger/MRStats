import SwiftUI

struct HeroesView: View {
    @EnvironmentObject var bannerManager: BannerManager
    @StateObject private var viewModel = HeroesViewModel()
    @State private var position = ScrollPosition(edge: .top)
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.mrDarkBlue.withAlphaComponent(0.8)).ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: viewModel.columns, spacing: 8) {
                        if viewModel.isLoading {
                            ForEach(0..<6) { _ in
                                HeroSkeleton()
                            }
                        } else {
                            ForEach(viewModel.sortedHeroes) { hero in
                                NavigationLink(value: hero) {
                                    HeroCell(hero)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    .navigationTitle("Heroes")
                    .navigationDestination(for: Hero.self) { hero in
                        let vm = HeroViewModel(hero: hero)
                        DetailHeroView()
                            .environmentObject(vm)
                    }
                }
                .scrollPosition($position)
                .onChange(of: viewModel.sorting, {
                    withAnimation(.bouncy) {
                        position.scrollTo(edge: .top)
                    }
                })
                .onAppear { viewModel.loadHeroes() }
                
                FilterView(selectedOption: $viewModel.sorting)
                    .padding()
            }
        }
    }
}
