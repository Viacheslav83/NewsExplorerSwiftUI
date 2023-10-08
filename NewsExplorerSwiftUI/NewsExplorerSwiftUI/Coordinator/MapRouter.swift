//
//  MapRouter.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

enum MapRouter: NavigationRouterProtocol {
    case onboarding
    case news
    case description
    case userName
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .onboarding, .news, .userName:
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
        case .news:
            NewsView()
        case .description:
            DescriptionNewsView()
        case .userName:
            UserNameView()
        }
    }
}
