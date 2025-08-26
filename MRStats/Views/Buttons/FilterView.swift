import SwiftUI

struct FilterView: View {
    @State var shouldShowOptions: Bool = false
    @Binding var selectedOption: Sorting
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            if shouldShowOptions {
                OptionsView(selectedOption: $selectedOption, shouldShowOptions: $shouldShowOptions)
                    .animation(.smooth(duration: 0.2)) { content in
                        content
                            .offset(x: shouldShowOptions ? -6.0 : 0.0)
                    }
            }
            
            SideButton(shouldExpand: $shouldShowOptions, image: .filter) {
                withAnimation(.bouncy) {
                    shouldShowOptions.toggle()
                }
            }
            
            .foregroundStyle(
                selectedOption == .none ? .mrDarkBlue : .mrYellow
            )
            .background {
                Circle()
                    .fill(selectedOption == .none ? .mrYellow : .mrDarkBlue)
                    .stroke(selectedOption == .none ? .mrDarkBlue : .mrYellow, lineWidth: 2)
            }
            .animation(.smooth(duration: 0.2)) { content in
                content
                    .scaleEffect(shouldShowOptions ? 1.25 : 1.0)
            }
        }
    }
}

struct OptionsView: View {
    @Binding var selectedOption: Sorting
    @Binding var shouldShowOptions: Bool
    
    var body: some View {
        HStack {
            ForEach(Sorting.allCases, id: \.rawValue) { option in
                Text(option.title)
                    .font(CustomFonts.getFont(size: 20))
                    .foregroundStyle(selectedOption == option ? .mrYellow : .mrDarkBlue)
                    .padding(8)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(selectedOption == option ? .mrDarkBlue : .mrYellow)
                    }
                    .onTapGesture {
                        selectedOption = option
                        shouldShowOptions.toggle()
                    }
            }
        }
        .frame(height: 40)
    }
}
