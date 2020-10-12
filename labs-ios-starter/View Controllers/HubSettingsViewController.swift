//
//  HubSettingsViewController.swift
//  labs-ios-starter
//
//  Created by Mark Poggi on 10/8/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class HubSettingsViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameTexfField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    //MARK: - Properties
    let controller = BackendController.shared
    var authenticatedUserId: String {
        ProfileController.shared.authenticatedUserProfile?.id ?? ""
    }
    var authUser: User? {
        guard let authUser = controller.users[authenticatedUserId] else {return nil}
        return authUser
    }
    var name: String {
        "\(authUser?.firstName) \(authUser?.lastName)"}
    var address: String {
        "\(authUser?.address)"}

    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameTexfField.text = name
        companyTextField.text = controller.loggedInUser.company
        addressTextField.text = address
        phoneTextField.text = controller.loggedInUser.phone
        emailTextField.text = controller.loggedInUser.email

        self.nameTexfField.isEnabled = false
        self.companyTextField.isEnabled = false
        self.addressTextField.isEnabled = false
        self.phoneTextField.isEnabled = false
        self.emailTextField.isEnabled = false

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func updateViews() {

    }
    

    // MARK: - Actions
    @IBAction func editButtonTouched(_ sender: UIButton) {
        self.nameTexfField.isEnabled = true
        self.companyTextField.isEnabled = true
        self.addressTextField.isEnabled = true
        self.phoneTextField.isEnabled = true
        self.emailTextField.isEnabled = true
    }

    @IBAction func deleteButtonTouched(_ sender: UIButton) {
    }

}

// MARK: - Extension


