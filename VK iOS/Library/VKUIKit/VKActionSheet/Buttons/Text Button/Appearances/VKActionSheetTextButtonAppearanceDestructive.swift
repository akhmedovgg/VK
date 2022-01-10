//
//  VKActionSheetTextButtonAppearanceDestructive.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetTextButtonAppearanceDestructive: VKActionSheetTextButtonAppearance {
    var titleColor: UIColor = VKPalette.red
    var highlightedTitleColor: UIColor = VKPalette.red
    
    var titleFont: UIFont = .systemFont(ofSize: 20, weight: .regular)
    
    var backgroundColor: UIColor = VKPalette.white
    var highlightedBackgroundColor: UIColor = VKPalette.white.withAlphaComponent(0.8)
    
    var hasBottomLine: Bool = true
    var bottomLineColor: UIColor = VKPalette.blackAlpha12
    var highlightedBottomLineColor: UIColor = VKPalette.blackAlpha06
}
