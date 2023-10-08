//
//  OnboardingVM.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import Foundation

protocol OnboardingVMProtocol {
    func getOnboardingItems() -> [OnboardingModel]
}

final class OnboardingVM: OnboardingVMProtocol, ObservableObject {
    
    @Published private var items: [OnboardingModel] = [
        .init(id: UUID().uuidString,
              mainImage: .onboardingOne,
              title: "NEWS",
              pageNumber: 0),
        .init(id: UUID().uuidString,
              mainImage: .onboardingTwo,
              title: "searching NEWS",
              pageNumber: 1),
        .init(id: UUID().uuidString,
              mainImage: .onboardingThree,
              title: "searching NEWS by string",
              pageNumber: 2),
        .init(id: UUID().uuidString,
              mainImage: .onboardingFour,
              title: "searching NEWS by date",
              pageNumber: 3,
             isLastItem: true)
    ]
    
    init () {}
    
    func getOnboardingItems() -> [OnboardingModel] {
        return items
    }
}
