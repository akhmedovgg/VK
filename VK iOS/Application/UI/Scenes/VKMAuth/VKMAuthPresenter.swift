//
//  VKMAuthPresenter.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

protocol VKMAuthPresentationLogic {
    func presentErrorModal(response: VKMAuthModels.LaunchLoginScreen.Response)
}

class VKMAuthPresenter: VKMAuthPresentationLogic {
    
    // MARK: - Mine
    
    var viewController: VKMAuthDisplayLogic?
    
    // MARK: - VKMAuthPresentationLogic
    
    func presentErrorModal(response: VKMAuthModels.LaunchLoginScreen.Response) {
        let model = VKMAuthModels.LaunchLoginScreen.ViewModel.ErrorModal(title: "ERROR".localized(), description: response.errorMessage)
        viewController?.displayErrorModal(model: model)
    }
}
