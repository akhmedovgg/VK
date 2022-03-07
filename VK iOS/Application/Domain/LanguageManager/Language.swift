//
//  Language.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 23/02/22.
//

import Foundation

protocol LanguageProtocol {
    /// ISO language
    var name: String { get }
    
    /// ISO 639-1 code
    var shortCode: String { get }
}

struct Language: LanguageProtocol {
    let name: String
    let shortCode: String
}
