//
//  FunLoadingView.swift
//  FunLoadingView
//
//  Created by Roberto Sampaio on 08/02/17.
//  Copyright © 2017 Roberto Sampaio. All rights reserved.
//

import UIKit

public enum RSFunLoadingAnimation {
    case circular
    case fading
}

class RSFunLoadingView: UIView {
    
    private var timer: Timer?
    private var oldColor: UIColor?
    private let duration = 1.0
    private var animations: [RSFunLoadingAnimation] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.cornerRadius = rect.width/2
        layer.masksToBounds = true
        
    }
    
    func startAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: true, block: { _ in
            self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            
            let colorLayer = self.createMaskColorLayer(with: self.bounds)
            self.layer.addSublayer(colorLayer)
            self.runAnimations(on: colorLayer)
        })
    }
    
    func stopAnimation() {
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
    }
    
    func configureAnimation(_ animation: RSFunLoadingAnimation) {
        animations = [animation]
    }
    
    func configureAnimations(_ animations: [RSFunLoadingAnimation]) {
        self.animations = animations
    }
    
    private func createMaskColorLayer(with rect: CGRect) -> CAShapeLayer {
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: rect.width/2)
        
        let layer = CAShapeLayer()
        layer.fillColor = oldColor?.cgColor
        
        let randomColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        
        layer.strokeColor = randomColor.cgColor
        oldColor = randomColor
        
        layer.lineWidth = CGFloat(rect.width)
        layer.path = path.cgPath
        
        return layer
    }
    
    private func runAnimations(on layer: CAShapeLayer) {
        animations.forEach { animation in
            runAnimation(animation, on: layer)
        }
    }
    
    private func runAnimation(_ animation: RSFunLoadingAnimation, on layer: CAShapeLayer) {
        switch animation {
        case .circular:
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = duration
            animation.fromValue = 0
            animation.toValue = 1
            layer.add(animation, forKey: "drawCircleAnimation")
        case .fading:
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.autoreverses = true
            animation.duration = duration/2
            animation.fromValue = 0.3
            animation.toValue = 1
            layer.add(animation, forKey: "opacityIN")
        }
    }
}
