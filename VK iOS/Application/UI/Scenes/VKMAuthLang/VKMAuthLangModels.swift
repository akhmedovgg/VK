//
//  VKMAuthLangModels.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

enum VKMAuthLangModels {
    enum FetchLanguages {
        struct Request {
            
        }
        
        struct Response {
            var languages: [VKLanguage]
        }
        
        struct ViewModel {
            var displayedLanguages: [SetLanguage.ViewModel.DisplayedLanguage]
        }
    }
    
    enum GetLanguage {
        struct Request {
            
        }
        
        struct Response {
            var language: VKLanguage
        }
        
        struct ViewModel {
            var currentLanguage: SetLanguage.ViewModel.DisplayedLanguage
        }
    }
    
    enum SetLanguage {
        struct Request {
            var language: ViewModel.DisplayedLanguage
        }
        
        struct Response {
            var language: VKLanguage?
        }
        
        struct ViewModel {
            struct DisplayedLanguage {
                var code: String
                var name: String
            }
        }
    }
}
