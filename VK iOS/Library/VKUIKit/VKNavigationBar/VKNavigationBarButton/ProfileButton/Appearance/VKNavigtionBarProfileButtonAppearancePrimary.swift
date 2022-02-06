//
//  VKNavigtionBarProfileButtonAppearancePrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 06/02/22.
//

import Foundation
import UIKit

struct VKNavigtionBarProfileButtonAppearancePrimary: VKNavigtionBarProfileButtonAppearance {
    
    var highlightedImageAlpha: CGFloat? = 0.7
    
    var fullNameLabelColor: UIColor = VKPalette.black
    var highlightedFullNameLabelColor: UIColor? = VKPalette.gray600
    
    var networkStatusLabelColor: UIColor = VKPalette.gray400
    var highlightedNetworkStatusLabelColor: UIColor? = VKPalette.gray300
}
