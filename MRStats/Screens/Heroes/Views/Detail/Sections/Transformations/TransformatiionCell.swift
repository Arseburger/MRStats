import SwiftUI

struct TransformationCell: View {
    var item: Transformation
    
    var body: some View {
        MRImage(urlString: item.icon)
            .frame(width: 60, height: 60)
            .padding(2)
    }
}
