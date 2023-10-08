//
//  OnboardingModel.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import Foundation

struct OnboardingModel: Identifiable {
    let id          : String
    let mainImage   : ImageNameType
    let title       : String
    let pageNumber  : Int
    let isLastItem  : Bool
    
    init(
        id          : String = UUID().uuidString,
        mainImage   : ImageNameType,
        title       : String,
        pageNumber  : Int,
        isLastItem  : Bool = false
    ) {
        self.id             = id
        self.mainImage      = mainImage
        self.title          = title
        self.pageNumber     = pageNumber
        self.isLastItem     = isLastItem
    }
    
    static  let mockModel: OnboardingModel = {
        return .init(id: "13",
                     mainImage: .defaultImage,
                     title: "Title",
                     pageNumber: 0)
    }()
}
