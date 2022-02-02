//
//  VKAuthScreenSwiftyLauncherSerivce.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import SwiftyVK

class VKAuthScreenSwiftyLauncherSerivce: VKAuthScreenLauncherService {
    
    // MARK: - VKAuthScreenLauncherService
    
    func launch(completionHandler: @escaping VKAuthScreenLauncherCompletionHandler) {
        VK.sessions.default.logIn { _ in
            DispatchQueue.main.async {
                completionHandler(.success)
            }
        } onError: { error in
            var authorizationIsCancelled = false
            var errorMessage: String?
            
            switch error {
            case VKError.authorizationCancelled:
                authorizationIsCancelled = true
            case VKError.authorizationDenied:
                errorMessage = "VKM_AUTH_AUTH_DECLINED_MESSAGE".localized()
            case VKError.authorizationFailed:
                errorMessage = "VKM_AUTH_AUTH_FAILED_MESSAGE".localized()
            case VKError.authorizationUrlIsNil:
                errorMessage = "VKM_AUTH_AUTH_FAILED_MESSAGE".localized()
            default:
                errorMessage = "VKM_AUTH_UNKNOWN_ERROR_MESSAGE".localized()
            }
            
            if authorizationIsCancelled {
                DispatchQueue.main.async {
                    completionHandler(.cancelled)
                }
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(.failure(.unknownError(errorMessage!)))
            }
        }
    }
}
