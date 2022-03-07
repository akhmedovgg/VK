//
//  VKCredentials.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

class VKCredentials {
    
    let appID: String
    let secureKey: String
    let serviceToken: String
    
    static let sharedInstance = VKCredentials()
    
    private init() {
        let file: (name: String, `extension`: String) = ("VK Credentials", "plist")
        
        guard let path = Bundle.main.path(forResource: file.name, ofType: file.extension) else {
            fatalError("Could not resolve \"\(file.name).\(file.extension)\"")
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String: String] else {
            fatalError("Configuration file \"\(file.name).\(file.extension)\" does not match the type [String: String]")
        }
        
        guard let appID = dictionary["App ID"],
              let secureKey = dictionary["Secure key"],
              let serviceToken = dictionary["Service token"] else {
                  fatalError("\"\(file.name).\(file.extension)\" is not valid")
              }
        
        self.appID = appID
        self.secureKey = secureKey
        self.serviceToken = serviceToken
    }
}
