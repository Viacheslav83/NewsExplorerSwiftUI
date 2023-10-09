//
//  APIRequestProtocol.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import Foundation

protocol APIRequestProtocol {
    func get(request: URLRequest) async throws -> Result<Data, Error>
}


final class APIRequest: APIRequestProtocol {
    
    func get(request: URLRequest) async throws -> Result<Data, Error> {
        let (data, response) = try await URLSession.shared.data(for: request)
        return verifyResponse(data: data, response: response)
    }
    
    private func verifyResponse(data: Data, response: URLResponse) -> Result<Data, Error> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(APIError.unknown)
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return .success(data)
        case 400...499:
            return .failure(APIError.badRequest)
        case 500...599:
            return .failure(APIError.serverError)
        default:
            return .failure(APIError.unknown)
            
        }
    }
}
