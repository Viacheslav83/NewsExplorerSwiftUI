//
//  OnboardingItemView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

struct OnboardingItemView: View {
    //MARK: - Properties
    let model: OnboardingModel
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Image(model.mainImage.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: AppConstats.screenWidth * 0.7, height: AppConstats.screenWidth * 0.7)
                    .padding(.horizontal, AppConstats.leadingSpacing)
                    .cornerRadius(24)
                
                VStack {
                    Text(model.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)
                }
                
                Spacer()
            } //: VStack
            .padding(.horizontal, 30)
        } //: ZStack
    }
}

//MARK: - Preview
#Preview {
    OnboardingItemView(model: .mockModel)
}
