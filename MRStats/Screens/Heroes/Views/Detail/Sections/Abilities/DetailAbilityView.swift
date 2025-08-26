import SwiftUI

struct DetailAbilityView: View {
    @EnvironmentObject var viewModel: HeroViewModel
    
    var body: some View {
        VStack {
            if let ability = viewModel.selectedAbility {
                ScrollView {
                    VStack(spacing: 12) {
                        MRImage(urlString: ability.icon!)
                                .aspectRatio(contentMode: .fit)
                                .padding(4)
                                .frame(width: 90, height: 90)
                                .itemBordered(
                                    color: ability.type?.getColor() ?? .white,
                                    radius: 24, width: 4
                                )
                                .padding(.top, 12)
                            
                        
                        VStack(alignment: .center) {
                            Text(ability.name ?? "No Name")
                                .font(.title)
                                .multilineTextAlignment(.center)
                            
                            Text(ability.type?.rawValue ?? "No type")
                                .font(.title3)
                                .italic()
                                .fontWeight(.bold)
                        }
                        
                        if let description = ability.description?.clean() {
                            Text(description)
                                .foregroundStyle(.secondary)
                                .padding(.horizontal, 8)
                                .frame(maxWidth: .infinity)
                        }
                        
                        Color(.darkGray)
                            .frame(height: 2)
                        
                        if let additionalFields = ability.additionalFields {
                            let keys = additionalFields.map { $0.key }
                            let values = additionalFields.map { $0.value ?? "" }
                            
                            AdditionalFieldGrid(keys: keys, values: values)
                                .padding(.horizontal, 0)
                                .frame(maxHeight: .infinity)
                        }
                    }
                    .padding(.bottom, 12)
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.bottom, 4)
                .background(.mrDarkBlue)
                .itemBordered(
                    color: ability.type?.getColor() ?? .white,
                    radius: 20, width: 4
                )
            }
            
            CloseButton() {
                viewModel.isShowingAbilityInfo = false
                viewModel.selectedAbility = nil
            }
        }
    }
}

struct AdditionalFieldGrid: View {
    var keys: [String]
    var values: [String]
    
    var body: some View {
        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 16) {
            ForEach(keys.indices, id: \.self) { index in
                HStack {
                    VStack(alignment: .leading) {
                        Text(keys[index])
                            .font(.title3)
                            .fontWeight(.bold)
                            .monospaced()
                            .padding(.bottom, 0)
                        Text(values[index])
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
            }
        }
    }
}
