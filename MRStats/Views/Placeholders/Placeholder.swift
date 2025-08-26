import SwiftUI

struct PlaceholderView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .mrStyled(width: .infinity, height: 48, fontSize: 32)
            .padding()
    }
}
