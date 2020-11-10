//
//  UIColor.swift
//  labs-ios-starter
//
//  Created by Stephanie Ballard on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

extension UIColor {
    static let esbGreen = UIColor(named: "ESB GREEN")
    
    func darker(componentDelta: CGFloat = 0.2) -> UIColor {
        return makeColor(componentDelta: -1 * componentDelta)
    }
    
    func lighter(componentDelta: CGFloat = 0.1) -> UIColor {
        return makeColor(componentDelta: componentDelta)
    }
    
    private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
        return max(0, min(1, toComponent + value))
    }
    
    private func makeColor(componentDelta: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        )
    
        return UIColor(
            red: add(componentDelta, toComponent: red),
            green: add(componentDelta, toComponent: green),
            blue: add(componentDelta, toComponent: blue),
            alpha: alpha
        )
    }
}
