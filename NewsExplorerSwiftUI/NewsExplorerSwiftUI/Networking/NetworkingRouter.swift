//
//  NetworkingRouter.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import Foundation

// MARK: HTTPMethod
enum HTTPMethod: String {
    case get = "GET"
}

// MARK: NetworkingRouter
enum NetworkingRouter {
    case fetchNewsAtTextAndDate(text: String, date: String)
    
}

extension NetworkingRouter {
    
    var method: HTTPMethod {
        switch self {
        case .fetchNewsAtTextAndDate:
            return .get
        }
    }
        
    var queryItem: [URLQueryItem] {
        switch self {
        case .fetchNewsAtTextAndDate(text: let text, date: let date):
            return [
                URLQueryItem(name: "q", value: "\(text)"),
                URLQueryItem(name: "from", value: "\(date)"),
                URLQueryItem(name: "apiKey", value: "\(AppKey.apiKey)")
            ]
        }
    }
        
    func asURLRequest() throws -> URLRequest {
        var url = EndPoint.everything.url!
        url.append(queryItems: queryItem)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = Double.infinity
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
}
