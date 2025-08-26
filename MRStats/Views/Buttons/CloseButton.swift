import SwiftUI

struct CloseButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .foregroundStyle(.mrYellow)
                .frame(width: 32, height: 32)
        }
    }
}
