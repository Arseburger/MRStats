import SwiftUI

struct PlayersListView: View {
    @StateObject private var viewModel = PlayersViewModel()
    @EnvironmentObject var manager: CooldownManager
    
    private weak var bannerManager: BannerManager? = DI.shared.bannerManager
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 4) {
                MRSearchBar(searchBarDelegate: viewModel)
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.historyStore.history) { player in
                            NavigationLink(value: player.id) {
                                PlayerCell(name: player.name!, id: player.id ?? "")
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .padding(4)
                }
                .navigationDestination(for: String.self, destination: { id in
                    DetailPlayerView(id: id)
                })
                .overlay(alignment: .top) {
                    if let manager = bannerManager, let banner = viewModel.banner {
                        VStack {
                            manager.banner(banner, ofType: .failure)
                                .padding(.top, 4)
                        }
                    }
                }
                
                if !viewModel.shortPlayers.isEmpty {
                    SideButton(shouldExpand: .constant(false), image: .clear) {
                        viewModel.shortPlayers = []
                        viewModel.historyStore.clear()
                    }
                    .padding(8)
                    .foregroundStyle(.mrDarkBlue)
                    .background {
                        Circle()
                            .fill(.mrYellow)
                            .materialShadowed(radius: 28)
                    }
                    .padding(.vertical, 12)
                }
                
            }
            .emptyStated(viewModel.shortPlayers.isEmpty)
            .background {
                Color(.mrDarkBlue.opacity(0.8))
                    .ignoresSafeArea()
            }
            .navigationTitle("Players")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
