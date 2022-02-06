//
//  VKNavigationBarIconButtonAppearancePrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 04/02/22.
//

import Foundation
import UIKit

struct VKNavigationBarIconButtonAppearancePrimary: VKNavigationBarIconButtonAppearance {
    let iconColor: UIColor = VKPalette.azure300
    let highlightedIconColor: UIColor = VKPalette.azure300.withAlphaComponent(0.5)
}
