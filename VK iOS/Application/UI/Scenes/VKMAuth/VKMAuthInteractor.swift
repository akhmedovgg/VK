//
//  VKMAuthInteractor.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import SwiftyVK

protocol VKMAuthBusinessLogic {
    func launchLoginScreen(request: VKMAuthModels.LaunchLoginScreen.Request)
}

class VKMAuthInteractor: VKMAuthBusinessLogic {
    
    // MARK: - Mine
    
    var presenter: VKMAuthPresentationLogic?
    var worker: VKAuthScreenLauncherWorker?
    
    // MARK: - VKMAuthBusinessLogic
    
    func launchLoginScreen(request: VKMAuthModels.LaunchLoginScreen.Request) {
        worker?.launch { [weak self] result in
            guard let presenter = self?.presenter else {
                return
            }
            
            switch result {
            case .success:
                return
            case .failure(let error):
                switch error {
                case .unknownError(let errorMessage):
                    let response = VKMAuthModels.LaunchLoginScreen.Response(errorMessage: errorMessage)
                    presenter.presentErrorModal(response: response)
                }
            case .cancelled:
                return
            }
        }
    }
}
