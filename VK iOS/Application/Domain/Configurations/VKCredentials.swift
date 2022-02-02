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
        guard let path = Bundle.main.path(forResource: "VK Credentials", ofType: "plist") else {
            fatalError("Could not resolve \"VK Credentials.plist\"")
        }
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String: String] else {
            fatalError("Configuration file \"VK Credentials.plist\" does not match the type [String: String]")
        }
        
        appID = dictionary["App ID"]!
        secureKey = dictionary["Secure key"]!
        serviceToken = dictionary["Service token"]!
    }
}
