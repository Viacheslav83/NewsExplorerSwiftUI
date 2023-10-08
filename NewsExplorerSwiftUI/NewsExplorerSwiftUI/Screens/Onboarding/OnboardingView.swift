//
//  OnboardingView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    var body: some View {
        Text("OnboardingView")
    }
}

#Preview {
    OnboardingView()
}
