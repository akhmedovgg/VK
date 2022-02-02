//
//  VKMAuthModels.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

enum VKMAuthModels {
    enum LaunchLoginScreen {
        struct Request {
            
        }
        
        struct Response {
            var errorMessage: String
        }
        
        struct ViewModel {
            struct ErrorModal {
                var title: String
                var description: String
            }
        }
    }
}
