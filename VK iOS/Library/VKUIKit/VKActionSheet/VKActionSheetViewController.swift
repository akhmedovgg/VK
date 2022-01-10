//
//  VKActionSheet.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetViewController: VKViewController<VKActionSheetView> {
    private var tapGestureRecognizer: UITapGestureRecognizer!
    private var panGestureRecognizer: UIPanGestureRecognizer!
    private var previousControl: UIControl?
    
    required init(title: String? = nil, actionButtons: [VKActionSheetButton], cancelButton: VKActionSheetButton) {
        super.init(nibName: nil, bundle: nil)
        setupTransition()
        setupActionButtons(actionButtons: actionButtons, cancelButton: cancelButton)
        setTitle(title)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGestureRecognizer()
        setupPanGestureRecognizer()
    }
    
    private func setupTransition() {
        self.transitioningDelegate = self
        modalPresentationStyle = .overFullScreen
    }
    
    private func setupActionButtons(actionButtons: [VKActionSheetButton], cancelButton: VKActionSheetButton) {
        cancelButton.addTarget(self, action: #selector(didTapDismiss(_:)), for: .touchUpInside)
        
        for actionButton in actionButtons {
            actionButton.addTarget(self, action: #selector(didTapAction(_:)), for: .touchUpInside)
        }
        rootView.setupActionButtons(actionButtons: actionButtons, cancelButton: cancelButton)
    }
    
    @objc func didTapDismiss(_ sender: UIControl) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapAction(_ sender: VKActionSheetButton) {
        sender.completionHandler?()
        dismiss(animated: true, completion: nil)
    }
    
    private func setupTapGestureRecognizer() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        rootView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard (rootView.hitTest(gestureRecognizer.location(in: gestureRecognizer.view), with: nil) as? VKActionSheetView) != nil else {
            return
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func setupPanGestureRecognizer() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.cancelsTouchesInView = false
        rootView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        let pointView = gestureRecognizer.view?.hitTest(gestureRecognizer.location(in: gestureRecognizer.view), with: nil)
        if let prev = previousControl, !prev.isEqual(pointView) {
            prev.isHighlighted = false
        }
        
        guard let button = pointView as? VKActionSheetButton else {
            return
        }
        
        button.isHighlighted = true
        
        switch gestureRecognizer.state {
        case .began:
            previousControl = button
        case .changed:
            previousControl = button
        case .ended:
            button.sendActions(for: .touchUpInside)
            button.cancelTracking(with: nil)
        default:
            break
        }
    }
    
    func setTitle(_ title: String?) {
        rootView.actionSheetLabel.text = title
        rootView.actionSheetTitleContainerView.isHidden = title == nil
    }
}

extension VKActionSheetViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return VKActionSheetPresentAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return VKActionSheetDismissAnimationController()
    }
}
