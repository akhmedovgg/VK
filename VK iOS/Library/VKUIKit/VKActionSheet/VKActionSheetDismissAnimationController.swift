//
//  VKActionSheetDismissAnimationController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 09/01/22.
//

import Foundation
import UIKit

class VKActionSheetDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration = 0.386
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? VKActionSheetViewController,
              let snapshot = fromVC.view.snapshotView(afterScreenUpdates: true)
        else {
            return
        }
        let mainScreenBounds = UIScreen.main.bounds
        let containerView = transitionContext.containerView
        containerView.backgroundColor = VKPalette.blackAlpha35
        
        fromVC.rootView.isHidden = true
        
        containerView.addSubview(snapshot)
        snapshot.frame.origin.y = 0
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear) {
            containerView.backgroundColor = .clear
            snapshot.frame.origin.y = mainScreenBounds.size.height
        } completion: { _ in
            if !transitionContext.transitionWasCancelled {
                fromVC.rootView.removeFromSuperview()
            } else {
                fromVC.rootView.isHidden = false
            }
            
            snapshot.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
