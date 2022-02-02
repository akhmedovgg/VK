//
//  VKLanguageManager.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

class VKLanguageManager {
    
    let languages: [VKLanguage]
    
    let defaultLanguage: VKLanguage
    
    private let keyCurrentLanguage = "AppleLanguages"
    
    private let userDefaults: UserDefaults
    
    static let sharedInstance = VKLanguageManager()
    
    private init () {
        languages = [
            VKEnglishLanguage(),
            VKRussianLanguage()
        ]
        
        defaultLanguage = VKEnglishLanguage()
        userDefaults = UserDefaults.standard
    }
    
    func setLanguage(_ language: VKLanguage) {
        userDefaults.set([language.code], forKey: keyCurrentLanguage)
        UserDefaults.standard.synchronize()
    }
    
    func getLanguage() -> VKLanguage {
        guard let languages = UserDefaults.standard.array(forKey: keyCurrentLanguage) as? [String],
              let languageCode = languages.first else {
                  setLanguage(defaultLanguage)
                  return defaultLanguage
              }
        
        guard let foundLanguage = self.languages.first(where: { $0.code == languageCode }) else {
            setLanguage(defaultLanguage)
            return defaultLanguage
        }
        
        return foundLanguage
    }
}
