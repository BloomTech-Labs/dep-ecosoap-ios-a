//
//  LoginViewController.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import OktaAuth

class LoginViewControllerStarter: UIViewController {
    
    // MARK: - Properties
    let profileController = ProfileController.shared
    let backendController = BackendController.shared
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationSuccessful,
                                               object: nil,
                                               queue: .main,
                                               using: checkForExistingProfile)
        
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationExpired,
                                               object: nil,
                                               queue: .main,
                                               using: alertUserOfExpiredCredentials)
        
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.numberOfLines = 0
        label.text = "eco-soap bank"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "System", size: 17.0)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Saving, sanitizing, and supplying RECYCLED SOAP for the developing world"
        return label
    }()
    
    private lazy var registerAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor(named: "ESB Green"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(UIColor(named: "ESB Green"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        return button
    }()
    ///update
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor(named: "ESB Green"), for: .normal)
        button.backgroundColor = UIColor.white
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action:#selector(self.login), for: .touchUpInside)
        return button
    }()
    //updated
    private lazy var usernameTextField: UITextField = {
        let textfield = UITextField()
        let borderColor = UIColor.white
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = borderColor.cgColor
        textfield.layer.borderWidth = 1.0
        textfield.textContentType = .username
        textfield.clearButtonMode = .whileEditing
        textfield.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        textfield.layer.cornerRadius = 8
        textfield.attributedPlaceholder = NSAttributedString(string: "  Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textfield
    }()
    //updated
    private lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        let borderColor = UIColor.white
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = borderColor.cgColor
        textfield.layer.borderWidth = 1.0
        textfield.textContentType = .password
        textfield.clearButtonMode = .whileEditing
        textfield.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        textfield.layer.cornerRadius = 8
        textfield.attributedPlaceholder = NSAttributedString(string: "  Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
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
    //updated
    private lazy var textfieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    //updated
    private lazy var usernameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    //updated
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    //updated
    private lazy var usernameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return view
    }()
    //updated
    private lazy var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return view
    }()
    //updated
    private lazy var panelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    // MARK: - Actions
    @objc func login() {
        UIApplication.shared.open(ProfileController.shared.oktaAuth.identityAuthURL()!)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = UIColor(named: "ESB Green")
        
        //updated
        // Labels
        infoLabelStackView.addArrangedSubview(titleLabel)
        view.addSubview(infoLabelStackView)
        infoLabelStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80.0).isActive = true
        infoLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        infoLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true

        //updated
        // Panel View
        view.addSubview(panelView)
        panelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        panelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        panelView.topAnchor.constraint(equalTo: infoLabelStackView.bottomAnchor, constant: 20).isActive = true
        
        //updated
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
        
        //updated
        // Login Button
        panelView.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: panelView.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: panelView.trailingAnchor, constant: -20).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: panelView.bottomAnchor, constant: -20).isActive = true
        loginButton.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 20).isActive = true
        
        //updated
        // Forgot Password Button
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        forgotPasswordButton.topAnchor.constraint(equalTo: panelView.bottomAnchor, constant: 8.0).isActive = true
        forgotPasswordButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    private func alertUserOfExpiredCredentials(_ notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presentSimpleAlert(with: "Your Okta credentials have expired",
                           message: "Please sign in again",
                           preferredStyle: .alert,
                           dismissText: "Dimiss")
        }
    }
    
    // MARK: Notification Handling
    private func checkForExistingProfile(with notification: Notification) {
//        checkForExistingProfile()
        self.performSegue(withIdentifier: "ShowDetailProfileList", sender: nil)
    }
    
    private func checkForExistingProfile() {
        profileController.checkForExistingAuthenticatedUserProfile { [weak self] (exists) in
            
            guard let self = self,
                self.presentedViewController == nil else { return }
            
            guard let role = self.backendController.loggedInUser.role else { return }
            
            if role == "ADMIN" {
                self.performSegue(withIdentifier: "AdminModalSegue", sender: nil)
            }
            else if role == "HUB_ADMIN" {
                self.performSegue(withIdentifier: "HubAdminMainSegue", sender: nil)
            }
            else if role == "HUB_USER" {
                self.performSegue(withIdentifier: "HubUserMainSegue", sender: nil)
            }
            else if role == "HOTEL" {
                self.performSegue(withIdentifier: "HotelMainSegue", sender: nil)
                
            }
            
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalAddProfile" {
            guard let addProfileVC = segue.destination as? AddProfileViewController else { return }
            addProfileVC.delegate = self
        }
    }
}

// MARK: - Add Profile Delegate
extension LoginViewControllerStarter: AddProfileDelegate {
    func profileWasAdded() {
        checkForExistingProfile()
    }
}
