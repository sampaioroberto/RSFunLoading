//
//  FunLoadingViewController.swift
//  FunLoadingView
//
//  Created by Roberto Sampaio on 08/02/17.
//  Copyright © 2017 Roberto Sampaio. All rights reserved.
//

import UIKit

class RSFunLoadingViewController: UIViewController {
    
    private let funLoadingView = RSFunLoadingView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        let size:CGFloat = 100
        funLoadingView.frame = CGRect(x: view.frame.midX - size/2, y: view.frame.midY - size/2, width: size, height: size)
        view.addSubview(funLoadingView)
        funLoadingView.startAnimation()
    }
    
    func configure(with animation: RSFunLoadingAnimation) {
        funLoadingView.configureAnimation(animation)
    }
    
    func configure(with animations: [RSFunLoadingAnimation]){
        funLoadingView.configureAnimations(animations)
    }
}
