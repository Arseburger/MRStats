import SwiftUI

protocol MRSearchBarDelegate: AnyObject {
    var isLoading: Bool { get }
    func searchBar(didSubmit text: String) async
}

struct MRSearchBar: View {
    @State private var searchText: String = ""
    @FocusState private var isFocused: Bool
    @State private var isSearching: Bool = false {
        didSet {
            if !isSearching { searchText = "" }
        }
    }
    let searchBarDelegate: MRSearchBarDelegate?
    
    var body: some View {
        VStack {
            Group {
                HStack(alignment: .center, spacing: 0) {
                    TextField("", text: $searchText,
                              prompt: Text("Player name")
                        .foregroundStyle(.white.opacity(0.4))
                    )
                    .focused($isFocused)
                    .foregroundStyle(.white)
                    .frame(height: 36)
                    .padding(.horizontal, 16)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.mrDarkBlue)
                    }
                    .padding(.leading, 2)
                    
                    .overlay(alignment: .trailing) {
                        if !searchText.isEmpty {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "clear.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(.white.opacity(0.4))
                                    .clipShape(Circle())
                                    .padding(.trailing, 12)
                            }
                        }
                    }
                    .overlay {
                        if isSearching {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .tint(.mrDarkBlue)
                                .offset(x: 10)
                                .frame(maxWidth: .infinity)
                                .frame(height: 36)
                                .padding(.horizontal)
                                .background {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(.mrYellow)
                                }
                        }
                    }
                    .onSubmit {
                        isSearching = true
                        guard let delegate = searchBarDelegate else { return }
                        Task {
                            await delegate.searchBar(didSubmit: searchText)
                            isSearching = false
                        }
                    }
                    
                    Button {
                        isSearching.toggle()
                        if !isSearching {
                            Task {
                                guard let delegate = searchBarDelegate else { return }
                                await delegate.searchBar(didSubmit: searchText)
                                isSearching = false
                            }
                        }
                    } label: {
                        Image(systemName: isSearching ? "xmark" : "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.mrDarkBlue)
                            .frame(width: 20, height: 20)
                            .padding([.vertical, .trailing], 10)
                            .padding(.leading, 4)
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.mrYellow)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 64)
        .frame(maxWidth: .infinity)
        .background(.mrDarkBlue)
    }
}
