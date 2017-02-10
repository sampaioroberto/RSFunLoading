//
//  FunLoadingHandler.swift
//  FunLoadingView
//
//  Created by Roberto Sampaio on 08/02/17.
//  Copyright © 2017 Roberto Sampaio. All rights reserved.
//

import UIKit

public struct RSFunLoadingHandler {
    static var controller: RSFunLoadingViewController?
    
    public static func show(on viewController: UIViewController) {
        controller?.dismiss(animated: true, completion: nil)
        controller = RSFunLoadingViewController()
        viewController.present(controller!, animated: true, completion: nil)
    }
    
    public static func hide() {
        controller?.dismiss(animated: true, completion: nil)
    }
    
    public static func configure(with animation: RSFunLoadingAnimation) {
        controller?.configure(with: animation)
    }
    
    public static func configure(with animations: [RSFunLoadingAnimation]) {
        controller?.configure(with: animations)
    }
}
