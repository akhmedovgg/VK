//
//  VKActionSheetPresentAnimationController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 09/01/22.
//

import Foundation
import UIKit

class VKActionSheetPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration = 0.256
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? VKActionSheetViewController,
              let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
        else {
            return
        }
        let mainScreenBounds = UIScreen.main.bounds
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toVC.rootView)
        toVC.rootView.isHidden = true
        
        containerView.addSubview(snapshot)
        snapshot.frame.origin.y = mainScreenBounds.size.height
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear) {
            containerView.backgroundColor = VKPalette.blackAlpha35
            snapshot.frame.origin.y = 0
        } completion: { _ in
            if !transitionContext.transitionWasCancelled {
                toVC.rootView.isHidden = false
            }
            
            snapshot.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
