//
//  VKMAuthLangInteractor.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

protocol VKMAuthLangBusinessLogic {
    func fetchLanguages(request: VKMAuthLangModels.FetchLanguages.Request)
    func setLanguage(request: VKMAuthLangModels.SetLanguage.Request)
    func getCurrentLanguage(request: VKMAuthLangModels.GetLanguage.Request)
}

class VKMAuthLangInteractor: VKMAuthLangBusinessLogic {
    
    // MARK: - Mine
    
    var presenter: VKMAuthLangPresentationLogic?
    var languageManager: VKLanguageManager?
    
    // MARK: - VKMAuthLangBusinessLogic
    
    func fetchLanguages(request: VKMAuthLangModels.FetchLanguages.Request) {
        guard let presenter = presenter, let languageManager = languageManager else {
            return
        }
        let languages = languageManager.languages
        let response = VKMAuthLangModels.FetchLanguages.Response(languages: languages)
        presenter.presentLanguages(response: response)
        
    }
    
    func setLanguage(request: VKMAuthLangModels.SetLanguage.Request) {
        guard let presenter = presenter, let languageManager = languageManager else {
            return
        }

        let vkLanguage = languageManager.languages.first(where: { $0.code == request.language.code })!
        languageManager.setLanguage(vkLanguage)
        
        let response = VKMAuthLangModels.SetLanguage.Response(language: vkLanguage)
        presenter.presentCheckedLanguage(response: response)
    }
    
    func getCurrentLanguage(request: VKMAuthLangModels.GetLanguage.Request) {
        guard let presenter = presenter, let languageManager = languageManager else {
            return
        }
        
        let vkLanguage = languageManager.getLanguage()
        let response = VKMAuthLangModels.GetLanguage.Response(language: vkLanguage)
        presenter.presentDefaultLanguage(response: response)
    }
}
