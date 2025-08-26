import SwiftUI

struct MainView: View {
    @State private var tabSelection: TabBarItem = .heroes
    @State private var isLaunching: Bool = true
    
    var body: some View {
        MRTabBarContainerView(selectedItem: $tabSelection) {
            Group {
                HeroesView()
                    .tabBarItem(.heroes, selection: $tabSelection)
                
                MapsView()
                    .tabBarItem(.maps, selection: $tabSelection)
                
                PlayersListView()
                    .tabBarItem(.players, selection: $tabSelection)
            }
        }
        .tint(.contrastCaption)
        .overlay {
            if isLaunching {
                LaunchScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.smooth) {
                    isLaunching = false
                }
            }
        }
    }
}
