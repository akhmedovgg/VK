//
//  VKActionSheetTextButtonAppearancePrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetTextButtonAppearancePrimary: VKActionSheetTextButtonAppearance {
    var titleColor: UIColor = VKPalette.azure300
    var highlightedTitleColor: UIColor? = VKPalette.azure300.withAlphaComponent(0.8)
    
    var backgroundColor: UIColor = VKPalette.white
    var highlightedBackgroundColor: UIColor? = VKPalette.white.withAlphaComponent(0.8)
    
    var hasBottomLine: Bool = true
    var bottomLineColor: UIColor? = VKPalette.blackAlpha12
    var highlightedBottomLineColor: UIColor? = VKPalette.blackAlpha06
}
