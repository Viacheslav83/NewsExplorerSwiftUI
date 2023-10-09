//
//  EmptyMessageView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

struct EmptyMessageView: View {
    //MARK: - Properties
    let messageText: String
    
    //MARK: - Body
    var body: some View {
        Text(messageText)
            .foregroundColor(.green)
            .font(.largeTitle)
            .lineLimit(0)
    }
}

#Preview {
    EmptyMessageView(messageText: "Message")
}
