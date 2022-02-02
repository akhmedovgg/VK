//
//  VKEnglishLanguage.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

struct VKEnglishLanguage: VKLanguage {
    let name: String
    let code: String
    
    init() {
        self.name = "English"
        self.code = "en"
    }
}
