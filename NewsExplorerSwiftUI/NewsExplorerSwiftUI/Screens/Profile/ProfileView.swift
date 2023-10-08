//
//  ProfileView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage(UserDefaultsKeys.userName) var userName: String?
    
    var body: some View {
        ZStack {
            Color(ColorType.customBlueColor.rawValue)
            
            VStack {
                Spacer()
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    Text(userName ?? "Your name here")
                }
                .font(.title)
                .padding()
                .background(Color(ColorType.baseColor.rawValue))
                .cornerRadius(24)
                .shadow(radius: 10)
                
                Spacer()
                
                ButtonView(buttonType: .logout) {
                    logout()
                }
                .padding(.bottom, 32)
            }
            
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    ProfileView()
}

private extension ProfileView {
    func logout() {
        userName = nil
        appDelegate?.showScreens()
    }
}
