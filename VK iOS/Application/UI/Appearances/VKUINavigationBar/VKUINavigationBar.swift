//
//  VKUINavigationBar.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 07/03/22.
//

import Foundation
import UIKit

class VKUINavigationBar: UINavigationBar {
    var titleFont: UIFont? {
        get {
            if #available(iOS 13, *) {
                return scrollEdgeAppearance?.titleTextAttributes.first { $0.key == .font }?.value as? UIFont
            } else {
                return titleTextAttributes?.first { $0.key == .font }?.value as? UIFont
            }
        }
        set {
            if #available(iOS 13, *) {
                scrollEdgeAppearance?.titleTextAttributes = [
                    .font: newValue!
                ]
            } else {
                titleTextAttributes = [
                    .font: newValue!
                ]
            }
        }
    }
    
    override var backgroundColor: UIColor? {
        get {
            if #available(iOS 13, *) {
                return scrollEdgeAppearance?.backgroundColor
            } else {
                return super.backgroundColor
            }
        }
        set {
            if #available(iOS 13, *) {
                scrollEdgeAppearance?.backgroundColor = newValue
            } else {
                super.backgroundColor = newValue
            }
        }
    }
    
    override var backIndicatorImage: UIImage? {
        get {
            if #available(iOS 13, *) {
                return scrollEdgeAppearance?.backIndicatorImage
            } else {
                return super.backIndicatorImage
            }
        }
        set {
            if #available(iOS 13, *) {
                scrollEdgeAppearance?.setBackIndicatorImage(newValue, transitionMaskImage: newValue)
            } else {
                super.backIndicatorImage = newValue
            }
        }
    }
    
    override var shadowImage: UIImage? {
        get {
            if #available(iOS 13, *) {
                return scrollEdgeAppearance?.shadowImage
            } else {
                return super.shadowImage
            }
        }
        set {
            if #available(iOS 13, *) {
                scrollEdgeAppearance?.shadowImage = newValue
            } else {
                super.shadowImage = newValue
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCommon()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCommon()
    }
    
    private func setupCommon() {
        setupAppearance()
    }
    
    private func setupAppearance() {
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            scrollEdgeAppearance = appearance
        }
        
        UIStackView.appearance(whenContainedInInstancesOf: [VKUINavigationBar.self]).spacing -= 4
        
        backgroundColor = .white
        titleFont = VKFonts.vkSansDisplayMedium.font(size: 21)
        backIndicatorImage = UIImage(named: "28/chevron_back_28")!.resized(to: CGSize(width: 20, height: 28))
        
        self.shadowImage = {
            let uiScreen = UIScreen.main.bounds
            let view = UIView(frame: CGRect(x: 0, y: 0, width: uiScreen.width, height: 8))
            view.backgroundColor = .white
            let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
            return renderer.image { context in
                view.layer.render(in: context.cgContext)
            }
        }()
    }
}
