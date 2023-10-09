//
//  NewsView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    @StateObject var viewModel: NewsVM = NewsVM()
    @State private var showingDescriptionScreen = false
    @State private var selectedModel: ArticleModel?
    
    @State private var textFieldText: String = ""
    @State private var date = Date()
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    searchView
                }
                .padding(.horizontal, 16)
                
                if !viewModel.models.isEmpty {
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.models, id: \.id) { item in
                                NewsCell(model: item)
                                    .onTapGesture(perform: {
                                        showingDescriptionScreen.toggle()
                                        selectedModel = item
                                        itemTapped()
                                    })
                            }
                        }
                        .padding(.horizontal)
                    }
                } else {
                    Spacer()
                    EmptyMessageView(messageText: "Empty list!")
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("NEWS")
//            .alert(isPresented: $showAlert, content: {
//                return Alert(title: Text(viewModel.errorMessage ?? "Error message"))
//            })
        }
    }
}

#Preview {
    NewsView()
}

//MARK: - Properties
private extension NewsView {
    var searchView: some View {
        return VStack {
            TextField("search...", text: $textFieldText)
                .padding(.horizontal, 16)
                .font(.headline)
                .frame(height: 56)
                .background(Color(ColorType.baseColor.rawValue))
                .cornerRadius(8)
            
            DatePicker("Searching by date", selection: $date, displayedComponents: [.date])
                        .padding()
            
            ButtonView(buttonType: .custom(text: "Search")) {
                Task {
                    await viewModel.fetchData(searchText: textFieldText, with: date)
                }
            }
        }
    }
}

//MARK: - Functions
private extension NewsView {
    func itemTapped() {
        if let selectedModel = selectedModel {
            coordinator.show(.description(model: selectedModel))
            self.selectedModel = nil
        }
    }
}
