//
//  VKNavigationBarUserInfoButtonAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 08/02/22.
//

import Foundation
import UIKit

struct VKNavigationBarUserInfoButtonAppearancePrimary: VKNavigationBarUserInfoButtonAppearance {
    var animationDuration: CGFloat? = 0.072
    var highlightedProfileImageAplhaValue: CGFloat? = 0.8
    
    var fullNameColor: UIColor = VKPalette.black
    var highlightedFullNameColor: UIColor? = VKPalette.gray600
    
    var networkStatusColor: UIColor = VKPalette.steelGray300
    var highlightedNetworkStatusColor: UIColor? = VKPalette.steelGray200
}
