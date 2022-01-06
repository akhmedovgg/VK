//
//  VKButtonSize.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 30/12/21.
//

import Foundation
import UIKit

protocol VKButtonSize {
    var frameHeight: CGFloat { get }
    var leftSideIconWidth: CGFloat { get }
    var rightSideIconWidth: CGFloat { get }
    var insetBetweenIconsAndText: CGFloat { get }
    var contentInsetLeft: CGFloat { get }
    var contentInsetRight: CGFloat { get }
    var contentInsetTop: CGFloat { get }
    var contentInsetBottom: CGFloat { get }
    var fontSize: CGFloat { get }
}
