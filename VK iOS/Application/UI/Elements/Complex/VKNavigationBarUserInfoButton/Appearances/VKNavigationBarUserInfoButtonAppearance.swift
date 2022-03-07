//
//  VKNavigationBarUserInfoButtonAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 08/02/22.
//

import Foundation
import UIKit

protocol VKNavigationBarUserInfoButtonAppearance {
    var animationDuration: CGFloat? { get }
    var highlightedProfileImageAplhaValue: CGFloat? { get }
    
    var fullNameColor: UIColor { get }
    var highlightedFullNameColor: UIColor? { get }
    
    var networkStatusColor: UIColor { get }
    var highlightedNetworkStatusColor: UIColor? { get }
}
