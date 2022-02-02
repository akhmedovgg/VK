//
//  VKMAuthCoordinator.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import UIKit
import Swinject

protocol VKMAuthRoutingLogic {
    func navigateToChangeLanguage()
}

class VKMAuthCoordinator: VKCoordinator, VKMAuthRoutingLogic {
    
    // MARK: - Coordinator
    
    var childCoordinators: [VKCoordinator] = []
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let container = Container()
        let assembly = VKMAuthAssembly()
        assembly.assemble(container: container)
        let controller = container.resolve(VKMAuthViewController.self)!
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    // MARK: - VKMAuthRoutingLogic
    
    func navigateToChangeLanguage() {
        let authLangCoordinator = VKMAuthLangCoordinator(navigationContorller: navigationController)
        childCoordinators.append(authLangCoordinator)
        authLangCoordinator.start()
    }
}
