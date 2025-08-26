import SwiftUI

struct DetailPlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    private weak var bannerManager: BannerManager? = DI.shared.bannerManager
    
    var body: some View {
        if viewModel.isLoading {
            PlayerSkeleton(isLoading: viewModel.isLoading)
        } else {
            ZStack {
                Color(.mrDarkBlue.withAlphaComponent(0.8)).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        if var playerData = viewModel.player {
                            Group {
                                if let player: Player = playerData.player {
                                    PlayerInfoView(player: player, selectedSeason: $viewModel.selectedSeason)
                                }
                                
                                if let rankHistory = playerData.rankHistory, !rankHistory.isEmpty {
                                    RanksView(rankHistory: rankHistory)
                                }
                                
                                if let overallStats = playerData.overallStats, overallStats.totalMatches > 0 {
                                    PlayerStatsView(stats: overallStats)
                                }
                                
                                if let heroMatchups = playerData.heroMatchups, !heroMatchups.isEmpty {
                                    HeroMatchupsView(matchups: heroMatchups)
                                }
                                
                                if let teamMates = playerData.teamMates, !teamMates.isEmpty {
                                    TeamMatesView(teamMates: teamMates)
                                }
                                
                                if let maps = playerData.maps, !maps.isEmpty {
                                    RecentMapsView(maps: maps)
                                }
                            }
                            .onChange(of: viewModel.selectedSeason) { _, newSeason in
                                viewModel.loadPlayer(season: newSeason)
                                playerData = viewModel.player!
                            }
                        }
                        
                        if let lastUpdate = viewModel.lastUpdate() {
                            Text("Last update: \(lastUpdate)")
                                .foregroundStyle(.secondary)
                                .font(.caption)
                        }
                        
                        if !viewModel.isUpdating {
                            Button { viewModel.didPressUpdate = true }
                            label: {
                                UpdateButton()
                                    .padding(.bottom, 12)
                                    .padding(.top, -8)
                            }
                            .alert("Attention!", isPresented: $viewModel.didPressUpdate) {
                                Button { viewModel.updatePlayer() }
                                label: { Text("Update") }
                                
                                Button(role: .cancel) { viewModel.didPressUpdate = false }
                                label: { Text("Cancel") }
                            } message: {
                                Text("You can only update 1 specific player every 30 minutes.")
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .overlay(alignment: .top) {
                    if let manager = bannerManager, let banner = viewModel.banner {
                        VStack {
                            manager.banner(banner, ofType: .info)
                                .padding(.top, 4)
                        }
                    }
                }
            }
        }
    }
    
    init(id: String) {
        viewModel = PlayerViewModel(id: id)
    }
}
