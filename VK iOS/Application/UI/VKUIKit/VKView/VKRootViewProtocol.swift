//
//  VKRootViewProtocol.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 07/03/22.
//

import Foundation
import UIKit

protocol VKRootViewProtocol {
    associatedtype RootView
    
    var rootView: RootView { get }
}

extension VKRootViewProtocol where Self: UIViewController {
    var rootView: RootView {
        guard let rootView = view as? RootView else {
            fatalError(
                """
                Unable to cast '\(String(describing: view))' to the type '\(RootView.self)', \
                check 'loadView()' method implementation.
                """
            )
        }
        return rootView
    }
}
