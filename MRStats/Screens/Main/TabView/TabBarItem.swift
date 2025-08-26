import SwiftUI

enum TabBarItem: Hashable {
    case heroes, maps, players
    
    var title: String {
        switch self {
        case .heroes: return "Heroes"
        case .maps: return "Maps"
        case .players: return "Players"
        }
    }
}

struct TabBarItemsPreferenceKey: PreferenceKey {
    typealias Value = [TabBarItem]
    static let defaultValue: Value = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(_ tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}
