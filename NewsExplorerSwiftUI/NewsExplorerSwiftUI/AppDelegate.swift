//
//  AppDelegate.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

@main
final class AppDelegate: NSObject, UIApplicationDelegate {
    
    lazy var window: UIWindow? = .init(frame: UIScreen.main.bounds)
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        showScreens()
        
        return true
    }
}

extension AppDelegate {
    func showScreens() {
        let router: MapRouter = getRouter()
        let coordinator: Coordinator<MapRouter> = .init(startingRoute: router)
        
        let navigationController = coordinator.getNavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
    
    private func getRouter() -> MapRouter {
        @AppStorage(UserDefaultsKeys.isShowOnboarding) var isShowOnboarding: Bool?
        @AppStorage(UserDefaultsKeys.userName) var userName: String?
//        isShowOnboarding = false
//        userName = nil
        if userName != nil {
            return MapRouter.tabBar
        } else
        if let isShowOnboarding = isShowOnboarding, isShowOnboarding == true {
            return MapRouter.userName
        } else {
            return MapRouter.onboarding
        }
    }
}
