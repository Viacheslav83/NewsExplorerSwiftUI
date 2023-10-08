//
//  Coordinator.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

class Coordinator<Router: NavigationRouterProtocol>: ObservableObject {
    
    private let navigationController: UINavigationController
    private let startingRoute: Router?
    
    init(
        navigationController: UINavigationController = .init(),
        startingRoute: Router? = nil
    ) {
        self.navigationController = navigationController
        self.startingRoute = startingRoute
    }
    
    func start() {
        guard let route = startingRoute else { return }
        show(route)
    }
    
    func show(_ route: Router, animated: Bool = true) {
        let view = route.view()
        let viewWithCoordinator = view.environmentObject(self)
        let viewController = UIHostingController(rootView: viewWithCoordinator)
        
        switch route.transition {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            navigationController.present(viewController, animated: animated)
        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: animated)
        }
    }
    
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: true) { [weak self] in
            /// because there is a leak in UIHostingControllers that prevents from deallocation
            self?.navigationController.viewControllers = []
        }
    }
    
    func hideAndShowNavController(isHidden: Bool = false) {
        navigationController.navigationBar.isHidden = isHidden
    }
    
    func getNavigationController() -> UINavigationController {
        return navigationController
    }
}
