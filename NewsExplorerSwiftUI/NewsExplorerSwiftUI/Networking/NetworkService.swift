//
//  NetworkService.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(for router: NetworkingRouter, responseType: T.Type) async throws -> T
}


final class NetworkService: NetworkServiceProtocol {
    private let apiRequest: APIRequestProtocol
    
    init(apiRequest: APIRequestProtocol = APIRequest()) {
        self.apiRequest = apiRequest
    }
    
    func fetchData<T: Decodable>(
        for router: NetworkingRouter,
        responseType: T.Type
    ) async throws -> T {
        
        let request = try router.asURLRequest()
        let apiData = try await apiRequest.get(request: request)
        
        switch apiData {
        case .success(let data):
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        case .failure(let error):
            throw error
        }
    }
}
