//
//  VKButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 29/12/21.
//

import Foundation
import UIKit

class VKButton: UIControl {
    override var isHighlighted: Bool {
        didSet {
            let hasAnimation = layer.animation(forKey: "opacity") != nil
            if isHighlighted && !hasAnimation {
                CATransaction.begin()
                CATransaction.setCompletionBlock {[weak self] in
                    self?.alpha = self?.appearance.highlightedAlphaValue ?? 0.4
                }
                
                let animation = CABasicAnimation(keyPath: "opacity")
                animation.fromValue = 1
                animation.toValue = appearance.highlightedAlphaValue
                animation.duration = 0.04
                animation.repeatCount = 0
                animation.fillMode = .forwards
                animation.isRemovedOnCompletion = false
                self.layer.add(animation, forKey: "opacity")
                
                CATransaction.commit()
            } else if !isHighlighted && hasAnimation {
                CATransaction.begin()
                CATransaction.setCompletionBlock {[weak self] in
                    self?.alpha = 1
                    self?.layer.removeAnimation(forKey: "opacity")
                }
                
                let animation = CABasicAnimation(keyPath: "opacity")
                animation.fromValue = appearance.highlightedAlphaValue
                animation.toValue = 1
                animation.duration = 0.07
                animation.repeatCount = 0
                animation.fillMode = .forwards
                animation.isRemovedOnCompletion = false
                self.layer.add(animation, forKey: "opacity")
                
                CATransaction.commit()
            }
        }
    }
    
    let appearance: VKButtonAppearance
    
    let size: VKButtonSize
    
    private let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private let leftSideIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "BUTTON"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightSideIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required init(frame: CGRect = .zero, appearance: VKButtonAppearance, size: VKButtonSize) {
        self.appearance = appearance
        self.size = size
        super.init(frame: frame)
        commonInit()
    }
    
    override init(frame: CGRect) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.setupAppearance()
        self.setupViewHierarchy()
        self.setupConstraints()
    }
    
    private func setupAppearance() {
        backgroundColor = appearance.backgroundColor
        titleLabel.textColor = appearance.textColor
        layer.borderColor = appearance.borderColor?.cgColor
        layer.borderWidth = appearance.borderWidth
        layer.cornerRadius = appearance.cornerRadius
        titleLabel.font = .systemFont(ofSize: size.fontSize, weight: .medium)
    }
    
    private func setupViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        // ContainerView
        let containerViewTopAnchor = containerView.topAnchor.constraint(equalTo: topAnchor, constant: size.contentInsetTop)
        containerViewTopAnchor.identifier = "containerView.topAnchor"
        
        let containerViewBottomAnchor = containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: size.contentInsetBottom)
        containerViewBottomAnchor.identifier = "containerView.bottomAnchor"
        
        let containerViewLeadingAnchor = containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.contentInsetLeft)
        containerViewLeadingAnchor.identifier = "containerView.leadingAnchor"
        
        let containerViewTrailingAnchor = containerView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        containerViewTrailingAnchor.identifier = "containerView.trailingAnchor"
        
        NSLayoutConstraint.activate([containerViewTopAnchor, containerViewBottomAnchor, containerViewLeadingAnchor, containerViewTrailingAnchor])
        
        // TitleLabel
        let titleLabelTopAnchor = titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor)
        titleLabelTopAnchor.identifier = "titleLabel.topAnchor"
        
        let titleLabelBottomAnchor = titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        titleLabelBottomAnchor.identifier = "titleLabel.bottomAnchor"
        
        let titleLabelWidthAnchor = titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0)
        titleLabelWidthAnchor.identifier = "titleLabel.widthAnchor"
        
        let titleLabelLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        titleLabelLeadingAnchor.identifier = "titleLabel.leadingAnchor"
        NSLayoutConstraint.activate([titleLabelTopAnchor, titleLabelBottomAnchor, titleLabelWidthAnchor, titleLabelLeadingAnchor])
        
        // Root
        let trailingAnchor = trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: size.contentInsetRight)
        trailingAnchor.identifier = "trailingAnchor"
        NSLayoutConstraint.activate([trailingAnchor])
    }
        
    func setLeftSideIcon(_ image: UIImage) {
        leftSideIcon.image = image
        
        guard leftSideIcon.superview == nil else {
            return
        }
        
        addSubview(leftSideIcon)
        
        NSLayoutConstraint.deactivate([
            containerView.constraints.first(where: { $0.identifier == "titleLabel.leadingAnchor" })!
        ])
        
        let leftSideIconTopAnchor = leftSideIcon.topAnchor.constraint(equalTo: containerView.topAnchor)
        leftSideIconTopAnchor.identifier = "leftSideIcon.topAnchor"
        
        let leftSideIconLeadingAnchor = leftSideIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        leftSideIconLeadingAnchor.identifier = "leftSideIcon.leadingAnchor"
        
        let leftSideIconBottomAnchor = leftSideIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        leftSideIconBottomAnchor.identifier = "leftSideIcon.bottomAnchor"
                
        let leftSideIconWidthAnchor = leftSideIcon.widthAnchor.constraint(equalToConstant: size.leftSideIconWidth)
        leftSideIconWidthAnchor.identifier = "leftSideIcon.widthAnchor"
        
        let titleLabelLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: leftSideIcon.trailingAnchor, constant: size.insetBetweenIconsAndText)
        titleLabelLeadingAnchor.identifier = "titleLabel.leadingAnchor"
        
        NSLayoutConstraint.activate([leftSideIconTopAnchor, leftSideIconLeadingAnchor, leftSideIconBottomAnchor, leftSideIconWidthAnchor, titleLabelLeadingAnchor])
    }
    
    func removeLeftSideIcon() {
        guard leftSideIcon.superview != nil else {
            return
        }
        
        leftSideIcon.removeFromSuperview()
        
        let leadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        leadingAnchor.identifier = "titleLabel.leadingAnchor"
        
        NSLayoutConstraint.activate([leadingAnchor])
    }
    
    func setRightSideIcon(_ image: UIImage) {
        rightSideIcon.image = image
        
        guard rightSideIcon.superview == nil else {
            return
        }
        
        addSubview(rightSideIcon)
        
        NSLayoutConstraint.deactivate([
            containerView.constraints.first(where: { $0.identifier == "containerView.trailingAnchor" })!
        ])
        
        let rightSideIconTopAnchor = rightSideIcon.topAnchor.constraint(equalTo: containerView.topAnchor)
        rightSideIconTopAnchor.identifier = "rightSideIcon.topAnchor"
        
        let rightSideIconLeadingAnchor = rightSideIcon.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: size.insetBetweenIconsAndText)
        rightSideIconLeadingAnchor.identifier = "rightSideIcon.leadingAnchor"
        
        let rightSideIconBottomAnchor = rightSideIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        rightSideIconBottomAnchor.identifier = "rightSideIcon.bottomAnchor"
        
        let rightSideIconWidthAnchor = rightSideIcon.widthAnchor.constraint(equalToConstant: size.rightSideIconWidth)
        rightSideIconWidthAnchor.identifier = "rightSideIcon.widthAnchor"
        
        let containerViewTrailingAnchor = containerView.trailingAnchor.constraint(equalTo: rightSideIcon.trailingAnchor)
        containerViewTrailingAnchor.identifier = "containerView.trailingAnchor"
        
        NSLayoutConstraint.activate([
            rightSideIconTopAnchor,
            rightSideIconLeadingAnchor,
            rightSideIconBottomAnchor,
            rightSideIconWidthAnchor,
            containerViewTrailingAnchor
        ])
    }
    
    func removeRightSideIcon() {
        guard rightSideIcon.superview != nil else {
            return
        }
        
        rightSideIcon.removeFromSuperview()
        
        let containerViewTrailingAnchor = containerView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        containerViewTrailingAnchor.identifier = "containerView.trailingAnchor"
        
        NSLayoutConstraint.activate([containerViewTrailingAnchor])
    }
}
