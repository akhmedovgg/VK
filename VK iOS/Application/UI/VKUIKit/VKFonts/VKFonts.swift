//
//  VKFonts.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 07/03/22.
//

import Foundation
import UIKit

enum VKFonts: String {
    case vkSansDisplayMedium = "VKSansDisplay-Medium"
}

extension VKFonts {
    func font(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
