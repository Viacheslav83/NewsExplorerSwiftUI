//
//  NewsVM.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

final class NewsVM: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var models: [ArticleModel] = []
    
    @Published var errorMessage: String? = nil
    @Published var showAlert: Bool = false
    
    init() {}
    
    @MainActor
    func fetchData(searchText: String? = nil, with date: Date) async {
        guard
            let searchText = searchText
        else {
            return
        }
        do {
            let dateString = getDateStringWithFormateFromTimestamp(date: date)
            let response = try await networkManager.fetchNews(text: searchText, date: dateString)
            models = response.articles ?? []
        } catch (let error) {
            models = []
            errorMessage = error.localizedDescription
        }
    }
    
    func getDateStringWithFormateFromTimestamp(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
