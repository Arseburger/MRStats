import SwiftUI

final class SearchHistoryStore: ObservableObject {
    @AppStorage("searchHistory") private var rawData: Data = Data()
    @Published private(set) var history: [SearchQuery] = []
    
    private let maxItems = 10
    
    init() {
        loadHistory()
    }
    
    private func loadHistory() {
        if let history = try? JSONDecoder().decode([SearchQuery].self, from: rawData) {
            self.history = history
        } else {
            self.history = []
        }
    }
    
    private func saveHistory() {
        if let encodedData = try? JSONEncoder().encode(history) {
            self.rawData = encodedData
        }
    }
    
    @MainActor
    func add(_ query: SearchQuery) {
        guard query.name != nil && query.id != nil else { return }
        history.removeAll { $0 == query }
        history.insert(query, at: 0)
        
        if history.count > maxItems {
            history.removeLast()
        }
        saveHistory()
    }
    
    @MainActor
    func clear() {
        history.removeAll()
        rawData = Data()
        saveHistory()
    }
}
