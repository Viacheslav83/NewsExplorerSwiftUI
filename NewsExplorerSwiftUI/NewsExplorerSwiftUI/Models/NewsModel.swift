//
//  NewsModel.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import Foundation

struct NewsModel: Decodable, Identifiable {
    let id: String = UUID().uuidString
    
    let code: String?
    let message: String?
    
//    let status: String
    let status: StatusType
    let totalResults: Int?
    let articles: [ArticleModel]?
}

struct ArticleModel: Decodable, Identifiable {
    let id: String = UUID().uuidString
//    let source: SourceModel?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    static var mockModel: ArticleModel {
        return ArticleModel(author: "author",
                            title: "title", 
                            description: "description",
                            url: "url",
                            urlToImage: "urlToImage",
                            publishedAt: "publishedAt",
                            content: "content")
    }
}

struct SourceModel: Decodable {
    let id: String?
    let name: String?
}

enum StatusType: String, Decodable {
    case ok
    case error
}
