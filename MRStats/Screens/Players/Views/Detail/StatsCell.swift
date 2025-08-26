import SwiftUI

struct StatsCell: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.mrYellow)
            Text(value)
                .font(.headline)
        }
        .foregroundStyle(.mrYellow)
        .padding(.vertical, 4)
    }
}
