import SwiftUI

struct Costume: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let icon: String?
    let quality: String
    let description: String
    let appearance: String
}
