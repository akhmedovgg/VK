//
//  VKRussianLanguage.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

struct VKRussianLanguage: VKLanguage {
    let name: String
    let code: String
    
    init() {
        self.name = "Русский"
        self.code = "ru"
    }
}
