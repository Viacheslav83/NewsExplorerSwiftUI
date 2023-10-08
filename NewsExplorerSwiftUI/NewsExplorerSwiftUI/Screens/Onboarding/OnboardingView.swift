//
//  OnboardingView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    @State private var selectedPage: Int = 0
    @State private var buttonType: ButtonType = .next
    
    @AppStorage(UserDefaultsKeys.isShowOnboarding) var isFirstTimeUser: Bool?
    
    private let viewModel: OnboardingVMProtocol = OnboardingVM()
    private let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedPage {
                case 0:
                    OnboardingItemView(model: viewModel.getOnboardingItems()[0])
                        .background(Color.white)
                        .transition(transition)
                case 1:
                    OnboardingItemView(model: viewModel.getOnboardingItems()[1])
                        .background(Color.white)
                        .transition(transition)
                case 2:
                    OnboardingItemView(model: viewModel.getOnboardingItems()[2])
                        .background(Color.white)
                        .transition(transition)
                default:
                    OnboardingItemView(model: viewModel.getOnboardingItems()[3])
                        .background(Color.white)
                        .transition(transition)
                }
            }
            
            buttonView
                .padding(.bottom, 40)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}

//MARK: - Properties
private extension OnboardingView {
    var buttonView: some View {
        ButtonView(buttonType: buttonType) {
            handleNextButtonPressed()
        }
    }
}

//MARK: - Functions
private extension OnboardingView {
    func handleNextButtonPressed() {
        guard selectedPage != 3
        else {
            isFirstTimeUser = true
            appDelegate?.showScreens()
            selectedPage = 0
            return
        }
        withAnimation(.spring()) {
            buttonType = selectedPage == 2 ? .finish : .next
            selectedPage += 1
        }
    }
}
