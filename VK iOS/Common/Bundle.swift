//
//  Bundle.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 07/03/22.
//

import Foundation
import UIKit

extension Bundle {
    static func swizzleLocalization() {
        let originalSelector = #selector(localizedString(forKey:value:table:))
        let originalMethod = class_getInstanceMethod(self, originalSelector)!
        let originalMethodImplementation = method_getImplementation(originalMethod)

        let swizzledSelector = #selector(myLocalizedString(forKey:value:table:))
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)!
        let swizzledMethodImplementation = method_getImplementation(swizzledMethod)

        if class_addMethod(self, originalSelector, swizzledMethodImplementation, method_getTypeEncoding(swizzledMethod)) {
            class_replaceMethod(self, swizzledSelector, originalMethodImplementation, method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    @objc private func myLocalizedString(forKey key: String, value: String?, table: String?) -> String {
        let currentLanguage = LanguageManager.sharedInstance.getLanguage()
        guard let bundlePath = Bundle.main.path(forResource: currentLanguage.shortCode, ofType: "lproj"),
              let bundle = Bundle(path: bundlePath) else {
                  return Bundle.main.myLocalizedString(forKey: key, value: value, table: table)
              }
        
        return bundle.myLocalizedString(forKey: key, value: value, table: table)
    }
}
