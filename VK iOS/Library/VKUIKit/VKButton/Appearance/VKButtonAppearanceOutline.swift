//
//  VKButtonAppearanceOutline.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceOutline: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.clear
    var highlightedBackgroundColor: UIColor = VKPalette.clear
    
    var textColor: UIColor = VKPalette.lightButtonOutlineForgeground
    var highlightedTextColor: UIColor = VKPalette.lightButtonOutlineForgeground.withAlphaComponent(0.5)
    
    var borderColor: UIColor? = VKPalette.lightButtonOutlineBorder
    var highlightedBorderColor: UIColor? = VKPalette.lightButtonOutlineBorder.withAlphaComponent(0.5)
    
    var borderWidth: CGFloat = 2
    var cornerRadius: CGFloat = 10
}
