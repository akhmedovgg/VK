//
//  VKButtonAppearanceCommerce.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceCommerce: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.lightButtonCommerceBackground
    var highlightedBackgroundColor: UIColor = VKPalette.lightButtonCommerceBackground.withAlphaComponent(0.5)
    
    var textColor: UIColor = VKPalette.lightButtonCommerceForgeground
    var highlightedTextColor: UIColor = VKPalette.lightButtonCommerceForgeground
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
}
