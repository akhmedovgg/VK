//
//  VKLanguage.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

protocol VKLanguage {
    
    /// ISO language name
    var name: String { get }
    
    /// ISO 639-1 code
    var code: String { get }
}
