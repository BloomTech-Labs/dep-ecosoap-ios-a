//
//  DashboardButton.swift
//  labs-ios-starter
//
//  Created by Stephanie Ballard on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class DashboardButton: UIButton {
    
    var animator = UIViewPropertyAnimator()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createGradient()
    }
    
    func createGradient() {
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = [UIColor.esbGreen?.lighter().cgColor, UIColor.esbGreen?.cgColor]
        gradientlayer.locations = [0.0, 1.0]
        gradientlayer.frame = bounds
        gradientlayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientlayer.cornerRadius = self.layer.cornerRadius
        layer.insertSublayer(gradientlayer, at: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animator = UIViewPropertyAnimator(duration: 0.25, curve: .linear) {
            self.alpha = 0.7
            // shrinking down x and y as button is being tapped
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        animator.addCompletion { position in
            switch position {
            case .start:
                self.alpha = 0.7
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            case .end:
                self.alpha = 1.0
                self.transform = .identity
            default:
                break
            }
        }
        animator.startAnimation()
        animator.pauseAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
    }
}

