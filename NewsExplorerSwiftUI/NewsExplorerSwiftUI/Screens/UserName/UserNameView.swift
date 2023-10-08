//
//  UserNameView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

struct UserNameView: View {
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    @State private var textFieldText: String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    
    @AppStorage(UserDefaultsKeys.userName) var userName: String?
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("What is your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            TextField("Your name here...", text: $textFieldText)
                .padding(.horizontal, 16)
                .font(.headline)
                .frame(height: 56)
                .background(Color(ColorType.baseColor.rawValue))
                .cornerRadius(8)
            
            Spacer()
            
            Spacer()
            ButtonView(buttonType: .finish) {
                guard textFieldText.count > 2
                else {
                    showAlert(title: "Your name must be at least 3 characters long!")
                    return
                }
                userName = textFieldText
                appDelegate?.showScreens()
            }
        }
        .padding(30)
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle)) 
        })
    }
}

#Preview {
    UserNameView()
}

//MARK: - Functions
private extension UserNameView {
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
