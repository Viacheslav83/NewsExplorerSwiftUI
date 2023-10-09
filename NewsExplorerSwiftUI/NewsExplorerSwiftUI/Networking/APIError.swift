//
//  APIError.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import Foundation

enum APIError: Error {
    case badRequest
    case serverError
    case unknown
}
