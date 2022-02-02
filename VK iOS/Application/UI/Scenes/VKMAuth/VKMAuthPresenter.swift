//
//  VKMAuthPresenter.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

protocol VKMAuthPresentationLogic {
    func authorizationCompleted(response: VKMAuthModels.LaunchLoginScreen.Response)
    func presentErrorModal(response: VKMAuthModels.LaunchLoginScreen.Response)
}

class VKMAuthPresenter: VKMAuthPresentationLogic {
    
    // MARK: - Mine
    
    var viewController: VKMAuthDisplayLogic?
    
    // MARK: - VKMAuthPresentationLogic
    
    func authorizationCompleted(response: VKMAuthModels.LaunchLoginScreen.Response) {
        guard let viewController = viewController else {
            return
        }
        
        let accountInformation = VKMAuthModels.LaunchLoginScreen.ViewModel.Account()
        viewController.authorizationCompleted(model: accountInformation)
    }
    
    func presentErrorModal(response: VKMAuthModels.LaunchLoginScreen.Response) {
        guard let viewController = viewController, let errorMessage = response.errorMessage else {
            return
        }
        
        let model = VKMAuthModels.LaunchLoginScreen.ViewModel.ErrorModal(title: "ERROR".localized(), description: errorMessage)
        viewController.displayErrorModal(model: model)
    }
}
