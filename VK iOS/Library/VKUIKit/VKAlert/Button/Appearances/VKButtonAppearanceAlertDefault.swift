//
//  VKButtonAppearanceAlertDefault.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 11/01/22.
//

import Foundation
import UIKit

class VKButtonAppearanceAlertDefault: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.white
    var highlightedBackgroundColor: UIColor = VKPalette.black.withAlphaComponent(0.1)
    
    var textColor: UIColor = VKPalette.azure300
    var highlightedTextColor: UIColor = VKPalette.azure300
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 0
}
