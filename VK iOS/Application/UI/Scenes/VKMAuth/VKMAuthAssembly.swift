//
//  VKMAuthAssembly.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import Swinject

class VKMAuthAssembly: Assembly {
    func assemble(container: Container) {
        container.register(VKAuthScreenLauncherWorker.self) { _ in
            let service = VKAuthScreenSwiftyLauncherSerivce()
            let worker = VKAuthScreenLauncherWorker(launcherService: service)
            return worker
        }
        
        container.register(VKMAuthViewController.self) { _ in
            return VKMAuthViewController()
        }.initCompleted { resolver, viewController in
            viewController.interactor = resolver.resolve(VKMAuthBusinessLogic.self)
        }
        
        container.register(VKMAuthBusinessLogic.self) { resolver in
            let interactor = VKMAuthInteractor()
            interactor.presenter = resolver.resolve(VKMAuthPresentationLogic.self)
            interactor.worker = resolver.resolve(VKAuthScreenLauncherWorker.self)
            return interactor
        }
        
        container.register(VKMAuthPresentationLogic.self) { resolver in
            let presenter = VKMAuthPresenter()
            presenter.viewController = resolver.resolve(VKMAuthViewController.self)
            return presenter
        }
    }
}
