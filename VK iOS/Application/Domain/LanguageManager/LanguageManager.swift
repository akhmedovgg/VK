//
//  LanguageManager.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 23/02/22.
//

import Foundation

protocol LanguageManagerProtocol {
    var languages: [LanguageProtocol] { get }
    func setLanguage(_ language: LanguageProtocol)
    func getLanguage() -> LanguageProtocol
}

class LanguageManager: LanguageManagerProtocol {
    
    static let sharedInstance = LanguageManager()
    
    private let userDefaults: UserDefaults
    
    let languages: [LanguageProtocol]
    
    private let defaultLanguage: LanguageProtocol
    
    private enum Keys: String {
        case appleLanguages = "AppleLanguages"
    }
    
    private init () {
        userDefaults = UserDefaults.standard
        languages = [
            Language(name: "English", shortCode: "en"),
            Language(name: "Русский язык", shortCode: "ru"),
            Language(name: "O'zbek tili", shortCode: "uz")
        ]
        defaultLanguage = languages.first!
    }
    
    func setLanguage(_ language: LanguageProtocol) {
        userDefaults.set([language.shortCode], forKey: Keys.appleLanguages.rawValue)
    }
    
    func getLanguage() -> LanguageProtocol {
        if let languageArray = userDefaults.array(forKey: Keys.appleLanguages.rawValue) {
            return languages.first { $0.shortCode == languageArray.first as? String }!
        }
        setLanguage(defaultLanguage)
        return defaultLanguage
    }
}
