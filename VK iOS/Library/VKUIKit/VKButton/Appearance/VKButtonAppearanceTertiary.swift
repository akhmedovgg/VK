//
//  VKButtonAppearanceTertiary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceTertiary: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.lightButtonTertiaryBackground
    var highlightedBackgroundColor: UIColor = VKPalette.lightButtonTertiaryBackground
    
    var textColor: UIColor = VKPalette.lightButtonTertiaryForgeground
    var highlightedTextColor: UIColor = VKPalette.lightButtonTertiaryForgeground.withAlphaComponent(0.5)
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
}
