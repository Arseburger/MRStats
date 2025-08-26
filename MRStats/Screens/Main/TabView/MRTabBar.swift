import SwiftUI

struct MRTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 2)
                .ignoresSafeArea()
                .foregroundStyle(.mrYellow)
            
            tabBarView
                .onChange(of: selection) { _, item in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        localSelection = item
                    }
                }
        }
    }
}

extension MRTabBarView {
    func tabView(tab: TabBarItem) -> some View {
        Text(tab.title)
            .font(CustomFonts.getFont(size: 24))
            .foregroundStyle(selection == tab ? .mrDarkBlue : .mrYellow)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    if localSelection == tab {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.mrYellow)
                            .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                    }
                }
            )
    }
    
    private var tabBarView: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab)
                    }
            }
        }
        .padding(8)
        .background(.mrDarkBlue)
    }
    
    private func switchToTab(_ tab: TabBarItem) {
        selection = tab
    }
}

struct MRTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    let content: Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
                .padding(.bottom, 50)
            MRTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
                .padding(0)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
    
    init(
        selectedItem: Binding<TabBarItem>,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selectedItem
        self.content = content()
    }
}
