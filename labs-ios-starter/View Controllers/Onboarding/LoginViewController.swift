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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.numberOfLines = 0
        label.text = "EcoSoap-Bank"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "System", size: 17.0)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.text = "Saving, sanitizing, and supplying RECYCLED SOAP for the developing world"
        return label
    }()
    
    private lazy var registerAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor(named: "ESB Blue"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(UIColor(named: "ESB Blue"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "ESB Green")
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.textContentType = .username
        textfield.clearButtonMode = .whileEditing
        textfield.placeholder = "  Username"
        textfield.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        textfield.layer.cornerRadius = 8
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        imageView.tintColor = .lightGray
        textfield.leftView = imageView
        textfield.leftViewMode = .always
        return textfield
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.textContentType = .password
        textfield.clearButtonMode = .whileEditing
        textfield.placeholder = "  Password"
        textfield.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        textfield.layer.cornerRadius = 8
        let imageView = UIImageView(image: UIImage(systemName: "lock.fill"))
        imageView.tintColor = .lightGray
        textfield.leftView = imageView
        textfield.leftViewMode = .always
        return textfield
    }()
    
    private lazy var infoLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var textfieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var usernameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var usernameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        view.backgroundColor = UIColor(named: "ESB Blue")
        return view
    }()
    
    private lazy var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        view.backgroundColor = UIColor(named: "ESB Blue")
        return view
    }()
    
    private lazy var panelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(named: "Panel System Background")
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
        
        // Panel View
        view.addSubview(panelView)
        panelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        panelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        panelView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        panelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        // Login Button
        panelView.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: panelView.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: panelView.trailingAnchor, constant: -20).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: panelView.bottomAnchor, constant: -20).isActive = true
        
        // Labels
        infoLabelStackView.addArrangedSubview(titleLabel)
        infoLabelStackView.addArrangedSubview(descriptionLabel)
        view.addSubview(infoLabelStackView)
        infoLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        infoLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        infoLabelStackView.bottomAnchor.constraint(equalTo: panelView.topAnchor, constant: -20).isActive = true

        // Forgot Password Button
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        forgotPasswordButton.topAnchor.constraint(equalTo: panelView.bottomAnchor, constant: 8.0).isActive = true
        
        // Textfields
        usernameStackView.addArrangedSubview(usernameTextField)
        usernameStackView.addArrangedSubview(usernameView)

        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(passwordView)

        textfieldStackView.addArrangedSubview(usernameStackView)
        textfieldStackView.addArrangedSubview(passwordStackView)
     
        
        panelView.addSubview(textfieldStackView)
        textfieldStackView.leadingAnchor.constraint(equalTo: panelView.leadingAnchor, constant: 20).isActive = true
        textfieldStackView.trailingAnchor.constraint(equalTo: panelView.trailingAnchor, constant: -20).isActive = true
        textfieldStackView.topAnchor.constraint(equalTo: panelView.topAnchor, constant: 20).isActive = true
        

    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
