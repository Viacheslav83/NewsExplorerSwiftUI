//
//  MapRouter.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

enum MapRouter: NavigationRouterProtocol {
    case onboarding
    case main
    case description
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .onboarding:
            return .push
        case .main:
            return .push
        case .description:
            return .push
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .onboarding:
            OnboardingView()
        case .main:
            NewsView()
        case .description:
            DescriptionNewsView()
        }
    }
}
