//
//  VKActionSheetInformativeButtonAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 10/01/22.
//

import Foundation
import UIKit

protocol VKActionSheetInformativeButtonAppearance {
    var iconTintColor: UIColor? { get }
    var highlightedIconTintColor: UIColor? { get }
    var disabledIconTintColor: UIColor? { get }
    
    var titleColor: UIColor { get }
    var highlightedTitleColor: UIColor { get }
    var disabledTitleColor: UIColor { get }
    
    var titleFont: UIFont { get }
    
    var descriptionColor: UIColor { get }
    var highlightedDescriptionColor: UIColor { get }
    var disabledDescriptionColor: UIColor { get }
    
    var descriptionFont: UIFont { get }
    
    var backgroundColor: UIColor { get }
    var highlightedBackgroundColor: UIColor { get }
    var disabledBackgroundColor: UIColor { get }
    
    var hasBottomLine: Bool { get }
    var bottomLineColor: UIColor { get }
    var highlightedBottomLineColor: UIColor { get }
}
