//
//  ButtonTextModifier.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.title2)
            .fontWeight(.semibold)
    }
}
