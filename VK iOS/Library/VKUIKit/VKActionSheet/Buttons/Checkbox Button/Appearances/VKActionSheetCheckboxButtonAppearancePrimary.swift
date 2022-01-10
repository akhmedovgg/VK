//
//  VKActionSheetCheckboxButtonAppearancePrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 11/01/22.
//

import Foundation
import UIKit

class VKActionSheetCheckboxButtonAppearancePrimary: VKActionSheetCheckboxButtonAppearance {
    var checkboxTintColor: UIColor? = VKPalette.azure300
    var highlightedCheckboxTintColor: UIColor? = VKPalette.azure300
    
    var titleColor: UIColor = VKPalette.black
    var highlightedTitleColor: UIColor = VKPalette.black

    var titleFont: UIFont = .systemFont(ofSize: 17, weight: .regular)
    
    var backgroundColor: UIColor = VKPalette.white
    var highlightedBackgroundColor: UIColor = VKPalette.white.withAlphaComponent(0.8)
    
    var hasBottomLine: Bool = true
    var bottomLineColor: UIColor = VKPalette.blackAlpha12
    var highlightedBottomLineColor: UIColor = VKPalette.blackAlpha06
}
