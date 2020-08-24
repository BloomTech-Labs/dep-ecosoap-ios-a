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
        button.setTitleColor(UIColor(named: "ESB Green"), for: .normal)
        button.backgroundColor = .white
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
        view.backgroundColor = UIColor(named: "ESB Green")
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
