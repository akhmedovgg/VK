//
//  VKMAuthLangAssembly.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import Swinject

class VKMAuthLangAssembly: Assembly {
    func assemble(container: Container) {
        container.register(VKLanguageManager.self) { _ in
            return VKLanguageManager.sharedInstance
        }
        
        container.register(VKMAuthLangViewController.self) { _ in
            let controller = VKMAuthLangViewController()
            controller.tableView.register(VKMAuthLangCell.self, forCellReuseIdentifier: VKMAuthLangCell.identifier)
            return controller
        }.initCompleted { resolver, viewController in
            viewController.interactor = resolver.resolve(VKMAuthLangBusinessLogic.self)
        }
        
        container.register(VKMAuthLangBusinessLogic.self) { resolver in
            let interactor = VKMAuthLangInteractor()
            interactor.presenter = resolver.resolve(VKMAuthLangPresentationLogic.self)
            interactor.languageManager = resolver.resolve(VKLanguageManager.self)
            return interactor
        }
        
        container.register(VKMAuthLangPresentationLogic.self) { resolver in
            let presenter = VKMAuthLangPresenter()
            presenter.viewController = resolver.resolve(VKMAuthLangViewController.self)
            return presenter
        }
    }
}
