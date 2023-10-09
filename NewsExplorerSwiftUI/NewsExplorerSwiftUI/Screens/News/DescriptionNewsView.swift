//
//  DescriptionNewsView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

struct DescriptionNewsView: View {
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    let model: ArticleModel
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            
            ScrollView {
                AsyncImage(url: URL(string: model.urlToImage ?? "")){ phase in
                    
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                        
                    } else if phase.error != nil{
                        Text("Couldn't load image")
                    } else {
                        VStack {
                            ProgressView()
                                .padding()
                            Text("Loading ...")
                        }
                    }
                }
                .frame(width: 150, height: 150, alignment: .center)
                
                Text(model.title ?? "")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Description: ")
                        .font(.callout)
                        .fontWeight(.regular)
                    Text(model.description ?? "")
                        .font(.callout)
                        .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                HStack {
                    Text("Author: ")
                        .font(.callout)
                        .fontWeight(.regular)
                    Text(model.author ?? "")
                        .font(.headline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                HStack {
                    Text("Content: ")
                        .font(.title)
                        .fontWeight(.regular)
                    Text(model.content ?? "")
                        .font(.headline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("Date: ")
                        .font(.callout)
                        .fontWeight(.regular)
                    Text(model.publishedAt ?? "")
                        .font(.headline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(16)
            .padding(.vertical, 8)
            .cornerRadius(24)
            .shadow(radius: 10)
            .frame(minWidth: AppConstats.screenWidth - 32, maxWidth: AppConstats.screenWidth - 24)
            
            Spacer()
        }
    }
}

#Preview {
    DescriptionNewsView(model: ArticleModel.mockModel)
}
