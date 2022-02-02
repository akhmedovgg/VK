//
//  VKMAuthViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import UIKit

protocol VKMAuthDisplayLogic: AnyObject {
    func displayErrorModal(model: VKMAuthModels.LaunchLoginScreen.ViewModel.ErrorModal)
}

class VKMAuthViewController: VKViewController<VKMAuthView>, VKMAuthDisplayLogic {
    
    // MARK: - Mine
    
    var interactor: VKMAuthBusinessLogic?
    var coordinator: VKMAuthRoutingLogic?
    
    private func setupViewElements() {
        setupLoginButton()
        setupChangeLanguageButton()
    }
    
    private func setupLoginButton() {
        rootView.loginButton.addTarget(self, action: #selector(didTapLogin(_:)), for: .touchUpInside)
    }
    
    @objc func didTapLogin(_ sender: VKButton) {
        let request = VKMAuthModels.LaunchLoginScreen.Request()
        interactor?.launchLoginScreen(request: request)
    }
    
    private func setupChangeLanguageButton() {
        rootView.changeLanguageButton.addTarget(self, action: #selector(didTapChangeLanguage(_:)), for: .touchUpInside)
    }
    
    @objc func didTapChangeLanguage(_ sender: VKButton) {
        coordinator?.navigateToChangeLanguage()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        rootView.reloadTexts()
        super.viewWillAppear(animated)
    }
    
    // MARK: - VKMAuthDisplayLogic
    
    func displayErrorModal(model: VKMAuthModels.LaunchLoginScreen.ViewModel.ErrorModal) {
        let alertVC = VKAlertViewController(title: model.title, message: model.description, axis: .vertical, actions: [
            VKAlertAction(style: .cancel, title: "CLOSE".localized())
        ])
        present(alertVC, animated: true)
    }
}
