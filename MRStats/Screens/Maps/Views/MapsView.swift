import SwiftUI

struct MapsView: View {
    @StateObject private var viewModel = MapsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    if viewModel.isLoading {
                        ForEach(0..<3) { _ in
                            MapSkeleton()
                        }
                    } else {
                        ForEach(viewModel.filteredMaps) { map in
                            MapCell(map: map)
                        }
                    }
                }
                .padding(.vertical, 16)
            }
            .background(Color.mrDarkBlue.opacity(0.9).ignoresSafeArea())
            .navigationTitle("Total Maps: \(viewModel.mapsCount)")
            .task {
                viewModel.loadMaps()
            }
        }
    }
}
