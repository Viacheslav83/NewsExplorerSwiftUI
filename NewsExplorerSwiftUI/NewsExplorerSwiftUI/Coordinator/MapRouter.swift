//
//  MapRouter.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

enum MapRouter: NavigationRouterProtocol {
    case description(model: ArticleModel)
    case onboarding
    case news
    case userName
    case tabBar
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .onboarding, .news, .userName, .tabBar:
            return .push
        case .description:
            return .presentModally
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .onboarding:
            OnboardingView()
//        case .news:
//            NewsView()
        case .description(model: let model):
            DescriptionNewsView(model: model)
        case .userName:
            UserNameView()
        case .tabBar:
            TabBarView()
        default: EmptyView()
        }
    }
}
