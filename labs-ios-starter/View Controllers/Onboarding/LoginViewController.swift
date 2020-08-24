//
//  LoginViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/24/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 17.0)
        label.numberOfLines = 0
        label.text = "EcoSoap-Bank"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 17.0)
        label.numberOfLines = 0
        label.text = "Saving, sanitizing, and supplying RECYCLED SOAP for the developing world"
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "ESB Green")
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        title = "Login"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = UIColor(named: "ESB System Background")
        
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        backgroundView.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20).isActive = true
        
        
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
