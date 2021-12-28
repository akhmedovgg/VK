//
//  VKButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 27/12/21.
//

import Foundation
import UIKit

public class VKButton: UIButton {
	public override var isHighlighted: Bool {
		didSet {
			guard let appearance = appearance else {
				return
			}
			let hasAnimation = layer.animation(forKey: "opacity") != nil
			if isHighlighted && !hasAnimation {
				CATransaction.begin()
				CATransaction.setCompletionBlock {[weak self] in
					self?.alpha = appearance.highlightedStateAlphaValue
				}
				
				let animation = CABasicAnimation(keyPath: "opacity")
				animation.fromValue = appearance.normalStateAlphaValue
				animation.toValue = appearance.highlightedStateAlphaValue
				animation.duration = 0.04
				animation.repeatCount = 0
				animation.fillMode = .forwards
				animation.isRemovedOnCompletion = false
				self.layer.add(animation, forKey: "opacity")
				
				CATransaction.commit()
			} else if !isHighlighted && hasAnimation {
				CATransaction.begin()
				CATransaction.setCompletionBlock {[weak self] in
					self?.alpha = appearance.normalStateAlphaValue
					self?.layer.removeAnimation(forKey: "opacity")
				}
				
				let animation = CABasicAnimation(keyPath: "opacity")
				animation.fromValue = appearance.highlightedStateAlphaValue
				animation.toValue = appearance.normalStateAlphaValue
				animation.duration = 0.07
				animation.repeatCount = 0
				animation.fillMode = .forwards
				animation.isRemovedOnCompletion = false
				self.layer.add(animation, forKey: "opacity")
				
				CATransaction.commit()
			}
		}
	}

	public private(set) var appearance: VKButtonAppearance?
	
	public init(frame: CGRect, appearance: VKButtonAppearance) {
		super.init(frame: frame)
		self.setAppearance(appearance)
	}
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setAppearance(_ appearance: VKButtonAppearance) {
		self.appearance = appearance
		backgroundColor = appearance.normalStateBackgroundColor
		setTitleColor(appearance.normalStateTitleColor, for: .normal)
		if let normalStateBorderColor = appearance.normalStateBorderColor {
			layer.borderWidth = appearance.normalStateBorderWidth
			layer.borderColor = normalStateBorderColor.cgColor
		}
	}
}
