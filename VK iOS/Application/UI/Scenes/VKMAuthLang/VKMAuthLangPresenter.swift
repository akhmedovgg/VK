//
//  VKMAuthLangPresenter.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

protocol VKMAuthLangPresentationLogic {
    func presentLanguages(response: VKMAuthLangModels.FetchLanguages.Response)
    func presentCheckedLanguage(response: VKMAuthLangModels.SetLanguage.Response)
    func presentDefaultLanguage(response: VKMAuthLangModels.GetLanguage.Response)
}

class VKMAuthLangPresenter: VKMAuthLangPresentationLogic {
    
    // MARK: - Mine
    
    weak var viewController: VKMAuthLangDisplayLogic?
    
    // MARK: - VKMAuthLangPresentationLogic
    
    func presentLanguages(response: VKMAuthLangModels.FetchLanguages.Response) {
        guard let viewController = viewController else {
            return
        }
        
        let languages: [VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage] = response.languages.map { vkLanguage in
            return VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage(code: vkLanguage.code, name: vkLanguage.name)
        }
        
        let viewModel = VKMAuthLangModels.FetchLanguages.ViewModel(displayedLanguages: languages)
        viewController.displayLanguages(viewModel: viewModel)
    }
    
    func presentCheckedLanguage(response: VKMAuthLangModels.SetLanguage.Response) {
        guard let viewController = viewController, let language = response.language else {
            return
        }
        
        let viewModel = VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage(code: language.code, name: language.name)
        viewController.setChecked(viewModel: viewModel)
    }
    
    func presentDefaultLanguage(response: VKMAuthLangModels.GetLanguage.Response) {
        guard let viewController = viewController else {
            return
        }
        let currentLanguage = VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage(code: response.language.code, name: response.language.name)
        let viewModel = VKMAuthLangModels.GetLanguage.ViewModel(currentLanguage: currentLanguage)
        viewController.setCheckedDefaultLanguage(viewModel: viewModel)
    }
}
