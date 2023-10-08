//
//  Tab.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

enum Tab: String, CaseIterable, Hashable {
    case news
    case profile

    var title: String {
        switch self {
        case .news:
            return "News"
        case .profile:
            return "Profile"
        }
    }
    
    var tag: Int {
        switch self {
        case .news:
            return 0
        case .profile:
            return 1
        }
    }

    var imageName: String {
        switch self {
        case .news:
            return "newspaper.circle"
        case .profile:
            return "person.circle"
        }
    }
}
