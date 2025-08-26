import SwiftUI

final class AlertManager: ObservableObject {
    
    @ViewBuilder func alert(_ title: String, message: String) -> some View {
        let alert = Alert(title: title, message: message)
        MRAlert(alert: alert)
    }
}
