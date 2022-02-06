//
//  VKNavigtionBarProfileButtonAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 06/02/22.
//

import Foundation
import UIKit

protocol VKNavigtionBarProfileButtonAppearance {
    var highlightedImageAlpha: CGFloat? { get }
    
    var fullNameLabelColor: UIColor { get }
    var highlightedFullNameLabelColor: UIColor? { get }
    
    var networkStatusLabelColor: UIColor { get }
    var highlightedNetworkStatusLabelColor: UIColor? { get }
}
