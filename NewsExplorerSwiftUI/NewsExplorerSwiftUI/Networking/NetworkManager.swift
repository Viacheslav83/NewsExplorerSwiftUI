//
//  NetworkManager.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import Foundation

final class NetworkManager {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
   func fetchNews(text: String, date: String) async throws -> NewsModel {
        let router: NetworkingRouter =  .fetchNewsAtTextAndDate(text: text, date: date)
        return try await networkService.fetchData(for: router, responseType: NewsModel.self)
    }
}
