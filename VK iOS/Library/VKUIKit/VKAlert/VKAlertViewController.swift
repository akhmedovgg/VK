//
//  VKAlertViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 31/12/21.
//

import Foundation
import UIKit

class VKAlertViewController: VKViewController<VKAlertView> {
    let alertTitle: String
    let alertMessage: String
    let axis: NSLayoutConstraint.Axis
    let actions: [VKAlertAction]
    
    required init(title: String, message: String, axis: NSLayoutConstraint.Axis, actions: [VKAlertAction]) {
        self.alertTitle = title
        self.alertMessage = message
        self.axis = axis
        self.actions = actions
        
        super.init(nibName: nil, bundle: nil)
        configureController()
        configureUI()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureController() {
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        modalTransitionStyle = UIModalTransitionStyle.crossDissolve
    }
    
    private func configureUI() {
        rootView.titleLabel.text = alertTitle
        rootView.descriptionLabel.text = alertMessage
        rootView.buttonsStackView.axis = axis
        
        for index in actions.indices {
            let action = actions[index]
            if index > 0 {
                let hr: UIView = {
                    let view = UIView()
                    if axis == .horizontal {
                        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
                    } else {
                        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
                    }
                    view.backgroundColor = VKPalette.black.withAlphaComponent(0.12)
                    return view
                }()
                rootView.buttonsStackView.addArrangedSubview(hr)
            }
                        
            let button = VKAlertButton(action: action)
            button.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
            button.tag = index

            rootView.buttonsStackView.addArrangedSubview(button)
        }
    }
    
    @objc func didTapAction(_ sender: UIControl) {
        let tag = sender.tag
        actions[tag].completionHandler?()
        dismiss(animated: true)
    }
}
