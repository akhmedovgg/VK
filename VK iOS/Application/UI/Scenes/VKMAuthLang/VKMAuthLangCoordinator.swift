//
//  VKMAuthLangCoordinator.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import UIKit
import Swinject

protocol VKMAuthLangRoutingLogic {
    func goBack()
}

class VKMAuthLangCoordinator: VKCoordinator, VKMAuthLangRoutingLogic {
    
    // MARK: - Mine
    
    var parentCoordinator: VKCoordinator?
    
    // MARK: - Coordinator
    
    var childCoordinators: [VKCoordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationContorller: UINavigationController) {
        self.navigationController = navigationContorller
    }
    
    func start() {
        let container = Container()
        let assembly = VKMAuthLangAssembly()
        assembly.assemble(container: container)
        let viewControler = container.resolve(VKMAuthLangViewController.self)!
        viewControler.coordinator = self
        navigationController.pushViewController(viewControler, animated: true)
    }
    
    // MARK: - VKMAuthLangRoutingLogic
    
    func goBack() {
        parentCoordinator?.childDidFinish(child: self)
        navigationController.popViewController(animated: true)
    }
}
