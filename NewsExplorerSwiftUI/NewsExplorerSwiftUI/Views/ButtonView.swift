//
//  ButtonView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

struct ButtonView: View {
    //MARK: - Properties
    var buttonType: ButtonType
    var didTapButton: (() -> ())?
    
    var body: some View {
            Button(action: {
                didTapButton?()
            }, label: {
                Text(buttonType.title)
                    .modifier(ButtonTextModifier())
            })
            .padding()
            .frame(maxWidth: AppConstats.screenWidth / 2)
            .background(buttonType.backgroundColor)
            .cornerRadius(buttonType.cornerRadius)
            .frame(height: buttonType.buttonHeight)
            .padding(.bottom, 16)
    }
}
