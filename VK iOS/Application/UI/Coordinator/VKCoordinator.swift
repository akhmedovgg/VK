//
//  VKCoordinator.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import UIKit

protocol VKCoordinator: AnyObject {
    var childCoordinators: [VKCoordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
    func childDidFinish(child: VKCoordinator)
}

extension VKCoordinator {
    func childDidFinish(child: VKCoordinator) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            return
        }
    }
}
