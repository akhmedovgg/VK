//
//  VKMAuthLangViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import UIKit

protocol VKMAuthLangDisplayLogic: AnyObject {
    func displayLanguages(viewModel: VKMAuthLangModels.FetchLanguages.ViewModel)
    func setChecked(viewModel: VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage)
    func setCheckedDefaultLanguage(viewModel: VKMAuthLangModels.GetLanguage.ViewModel)
}

class VKMAuthLangViewController: UITableViewController, VKMAuthLangDisplayLogic {
    
    // MARK: - Mine
    
    var interactor: VKMAuthLangBusinessLogic?
    var coordinator: VKMAuthLangRoutingLogic?
    var displayedLanguages: [VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage] = []
    var currentLanguage: VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage?
    
    private func configureController() {
        reloadTexts()
    }
    
    private func reloadTexts() {
        title = "VKM_AUTH_CHANGE_LANGUAGE".localized()
    }
    
    private func configureBackButton() {
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "BACK".localized()
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
    }
    
    @objc func didTapBack(_ sender: UIBarButtonItem) {
        coordinator?.goBack()
    }
    
    private func fetchLanguages() {
        guard let interactor = interactor else {
            return
        }

        let request = VKMAuthLangModels.FetchLanguages.Request()
        interactor.fetchLanguages(request: request)
    }
    
    private func fetchCurrentLanguage() {
        guard let interactor = interactor else {
            return
        }

        let request = VKMAuthLangModels.GetLanguage.Request()
        interactor.getCurrentLanguage(request: request)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBackButton()
        fetchLanguages()
        
        Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { [weak self]_ in
            self?.fetchCurrentLanguage()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.goBack()
    }
    
    // MARK: - UITableViewController
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VKMAuthLangCell.identifier, for: indexPath) as? VKMAuthLangCell else {
            return UITableViewCell()
        }
        
        let language =  displayedLanguages[indexPath.row]
        
        cell.titleLabel.text = displayedLanguages[indexPath.row].name
        cell.accessoryType = language.code == currentLanguage?.code ? .checkmark : .none
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedLanguages.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let interactor = interactor else {
            return
        }

        let selectedLanguage = displayedLanguages[indexPath.row]
        let request = VKMAuthLangModels.SetLanguage.Request(language: selectedLanguage)
        interactor.setLanguage(request: request)
    }
    
    // MARK: - VKMAuthDisplayLogic
    
    func displayLanguages(viewModel: VKMAuthLangModels.FetchLanguages.ViewModel) {
        self.displayedLanguages = viewModel.displayedLanguages
        tableView.reloadData()
    }
    
    func setChecked(viewModel: VKMAuthLangModels.SetLanguage.ViewModel.DisplayedLanguage) {
        currentLanguage = viewModel

        for indexPath in displayedLanguages.indices.map({ IndexPath(row: $0, section: 0) }) {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
        }

        let indexPath = IndexPath(row: displayedLanguages.firstIndex { $0.code == viewModel.code }!, section: 0)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        configureBackButton()
        reloadTexts()
    }
    
    func setCheckedDefaultLanguage(viewModel: VKMAuthLangModels.GetLanguage.ViewModel) {
        let indexPath = IndexPath(row: displayedLanguages.firstIndex { $0.code == viewModel.currentLanguage.code }!, section: 0)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
}
