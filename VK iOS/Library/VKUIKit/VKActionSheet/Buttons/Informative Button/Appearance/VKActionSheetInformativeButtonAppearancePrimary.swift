//
//  VKActionSheetInformativeButtonAppearancePrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetInformativeButtonAppearancePrimary: VKActionSheetInformativeButtonAppearance {
    var iconTintColor: UIColor? = VKPalette.azure300
    var highlightedIconTintColor: UIColor? = VKPalette.azure300
    var disabledIconTintColor: UIColor? = VKPalette.steelGray300
    
    var titleColor: UIColor = VKPalette.black
    var highlightedTitleColor: UIColor = VKPalette.black
    var disabledTitleColor: UIColor = VKPalette.steelGray300
    
    var titleFont: UIFont = .systemFont(ofSize: 17, weight: .regular)
    
    var descriptionColor: UIColor = VKPalette.steelGray400
    var highlightedDescriptionColor: UIColor = VKPalette.steelGray400
    var disabledDescriptionColor: UIColor = VKPalette.steelGray300
    
    var descriptionFont: UIFont = .systemFont(ofSize: 14, weight: .regular)
    
    var backgroundColor: UIColor = VKPalette.white
    var highlightedBackgroundColor: UIColor = VKPalette.white.withAlphaComponent(0.8)
    var disabledBackgroundColor: UIColor = VKPalette.white
    
    var hasBottomLine: Bool = true
    var bottomLineColor: UIColor = VKPalette.blackAlpha12
    var highlightedBottomLineColor: UIColor = VKPalette.blackAlpha06
}
