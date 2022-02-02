//
//  String.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

extension String {
    func localized() -> Self {
        let language = VKLanguageManager.sharedInstance.getLanguage()
    
        let path = Bundle.main.path(forResource: language.code, ofType: "lproj")
        if let path = path, let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        }

        return NSLocalizedString(self, comment: "")
    }
}
