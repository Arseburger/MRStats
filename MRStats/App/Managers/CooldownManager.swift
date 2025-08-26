import SwiftUI

final class CooldownManager: ObservableObject {
    @AppStorage("cooldownManager") private var data: Data?
    private var lastUpdates: [String: Date] = [:]
    
    fileprivate var halfHour: TimeInterval { 30 * 60 }
    
    func recordUpdate(for userId: String) {
        lastUpdates[userId] = Date.now + halfHour
    }
    
    func isCooling(_ userId: String) -> Bool {
        if let date = lastUpdates[userId] {
            return Date.now.distance(to: date) < 30 * 60
        }
        return false
    }
}

struct PlayerCooldown {
    let id: String
    var updateTime: Date
}


actor CooldownManager2 {
    private var lastUpdates: [String: Date] = [:]
    private let halfHour: TimeInterval = 30 * 60
    private let storageKey = "cooldown_data"

    init() async {
        await load()
    }

    func recordUpdate(for userId: String) {
        lastUpdates[userId] = Date.now + halfHour
        save()
    }

    func isCooling(_ userId: String) -> Bool {
        if let date = lastUpdates[userId] {
            return Date.now < date
        }
        return false
    }

    func remainingCooldown(for userId: String) -> TimeInterval? {
        guard let date = lastUpdates[userId] else { return nil }
        let remaining = date.timeIntervalSinceNow
        return remaining > 0 ? remaining : nil
    }

    // MARK: - Persistence

    private func save() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(lastUpdates) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    private func load() async {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else { return }
        let decoder = JSONDecoder()
        if let saved = try? decoder.decode([String: Date].self, from: data) {
            lastUpdates = saved
        }
    }
}
