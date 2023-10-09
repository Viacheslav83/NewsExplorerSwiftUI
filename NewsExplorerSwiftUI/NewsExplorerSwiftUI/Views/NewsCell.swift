//
//  NewsCell.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 09.10.2023.
//

import SwiftUI

struct NewsCell: View {
    var model: ArticleModel
    
    var body: some View {
        //        HStack {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(model.title ?? "")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            
            Text(model.description ?? "")
                .padding(.horizontal, 8)
                .font(.caption)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
//        .frame(width: AppConstats.screenWidth - 32)
        .padding(.vertical, 8)
        .foregroundColor(.black)
        .background(Color(ColorType.baseColor.rawValue))
        .cornerRadius(16)
    }
}

#Preview {
    NewsCell(model: ArticleModel.mockModel)
}
