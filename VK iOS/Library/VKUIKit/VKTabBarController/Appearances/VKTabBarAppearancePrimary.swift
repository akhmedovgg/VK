//
//  VKTabBarAppearancePrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

struct VKTabBarAppearancePrimary: VKTabBarAppearance {
    let iconColor: UIColor = VKPalette.gray300
    let highlightedIconColor: UIColor? = nil
    let selectedIconColor: UIColor? = VKPalette.azure300
    
    let textColor: UIColor = VKPalette.gray300
    let highlightedTextColor: UIColor? = nil
    let selectedTextColor: UIColor? = VKPalette.azure300
}
