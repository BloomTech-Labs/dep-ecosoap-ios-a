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
    @IBOutlet weak var editButton: UIButton!

    //MARK: - Properties
    let controller = BackendController.shared
    var userProfile: UpdateUserProfileInput!
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
    var toggle: Bool = false

    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        fetchAll()

        nameTexfField.text = authUser?.name
        companyTextField.text = authUser?.company
        addressTextField.text = authUser?.address?.city
        phoneTextField.text = authUser?.phone
        emailTextField.text = authUser?.email

        self.nameTexfField.isEnabled = false
        self.companyTextField.isEnabled = false
        self.addressTextField.isEnabled = false
        self.phoneTextField.isEnabled = false
        self.emailTextField.isEnabled = false
        self.editButton.setTitle("Edit", for: .normal)
        self.editButton.setTitle("Save", for: .selected)

        guard let role = authUser?.role else {return}
        print(role)

        guard let hub = authUser?.hub?.id else {return}
        print(hub)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Methods
    private func fetchAll() {
        controller.initialFetch(userId: controller.loggedInUser.id) { (error) in
            if let error = error {
                NSLog("\(error): Error occured during initial fetch")
            }
            if let user = self.controller.users[self.controller.loggedInUser.id] {
                self.controller.loggedInUser = user
                print(self.controller.loggedInUser.id)
            }
            print("\(self.controller.users)")
            print("\(self.controller.properties)")
            print("\(self.controller.pickups)")
            print("\(self.controller.payments)")
            print("\(self.controller.hubs)")
            print("\(self.controller.pickupCartons)")
            print("\(self.controller.hospitalityContracts)")
        }
    }

    private func updateProfile() {

    }

    // MARK: - Actions
    @IBAction func editButtonTouched(_ sender: UIButton) {
        if toggle == false  {
            self.nameTexfField.isEnabled = true
            self.companyTextField.isEnabled = true
            self.addressTextField.isEnabled = true
            self.phoneTextField.isEnabled = true
            self.emailTextField.isEnabled = true
            editButton.isSelected = true

            toggle = true
        } else {
            if toggle == true  {
                self.nameTexfField.isEnabled = false
                self.companyTextField.isEnabled = false
                self.addressTextField.isEnabled = false
                self.phoneTextField.isEnabled = false
                self.emailTextField.isEnabled = false
                editButton.isSelected = false
                _ = navigationController?.popViewController(animated: true)
            }
        }
    }
}



