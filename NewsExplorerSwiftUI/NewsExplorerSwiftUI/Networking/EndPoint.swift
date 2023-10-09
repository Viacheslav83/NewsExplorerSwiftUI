//
//  EndPoint.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import Foundation

protocol EndPointProtocol {
    var url: URL? { get }
}

extension EndPointProtocol {
    var baseURL: String {
        return "https://newsapi.org/v2/"
    }
}

enum EndPoint: String, EndPointProtocol {
    
    case everything = "everything"
    
    var url: URL? {
        return URL(string: baseURL + self.rawValue)
    }
    
    var urlString: String {
        return baseURL + self.rawValue
    }
}
