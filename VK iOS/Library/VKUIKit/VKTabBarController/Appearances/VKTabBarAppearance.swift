//
//  VKTabBarAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

protocol VKTabBarAppearance {
    var iconColor: UIColor { get }
    var highlightedIconColor: UIColor? { get }
    var selectedIconColor: UIColor? { get }
    
    var textColor: UIColor { get }
    var highlightedTextColor: UIColor? { get }
    var selectedTextColor: UIColor? { get }
}
