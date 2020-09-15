//
//  HelperExtensions.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenViewTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UITextField {
    func setupTextField() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.layer.cornerRadius = 8
    }
}

extension String {
    static var colorESBAqua = "ESB Aqua"
    static var colorESBBlack = "ESB Black"
    static var colorESBBlue = "ESB Blue"
    static var colorESBBrick = "ESB Brick"
    static var colorESBGold = "ESB Gold"
    static var colorESBGreen = "ESB Green"
    static var colorESBMagenta = "ESB Magenta"
    static var colorESBOrange = "ESB Orange"
    static var colorESBPink = "ESB Pink"
    static var colorESBRed = "ESB Red"
    static var colorESBSapphire = "ESB Sapphire"
    static var colorESBViolet = "ESB Violet"
    static var colorESBSystemBackground = "ESB System Background"
}

