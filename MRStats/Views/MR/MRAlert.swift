import SwiftUI

struct MRAlert: View {
    let alert: Alert
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(alert.title)
                .font(.title3)
                .foregroundStyle(.white)
            Text(alert.message)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(0)
        }
    }
}
