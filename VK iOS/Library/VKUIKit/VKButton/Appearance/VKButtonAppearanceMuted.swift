//
//  VKButtonAppearanceMuted.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceMuted: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.lightButtonMutedBackground
    var highlightedBackgroundColor: UIColor = VKPalette.lightButtonMutedBackground.withAlphaComponent(0.5)
    
    var textColor: UIColor = VKPalette.lightButtonMutedForgeground
    var highlightedTextColor: UIColor = VKPalette.lightButtonMutedForgeground.withAlphaComponent(0.5)
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
}
