//
//  AdminProfileDetailViewController.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/4/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

//TODO: MVP: Grab the authenticated user profile

class AdminProfileDetailViewController: UIViewController {
    
    //MARK:- Outlets
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var skypeTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    var currentUser: User? {
        return controller.loggedInUser
    }
    let controller = BackendController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let currentUser = currentUser else { return }
        var firstName: String = ""
        var lastName: String = ""
        var middleName: String = ""
        var phone: String = ""
        var skype: String = ""
        var email: String = ""
        
        if firstNameTextField.text == "" {
            firstName = currentUser.firstName
        } else {
            guard let uwFirstName = firstNameTextField.text else { return }
            firstName = uwFirstName
        }
        if lastNameTextField.text == "" {
            lastName = currentUser.lastName
        } else {
            guard let uwLastName = lastNameTextField.text else { return }
            lastName = uwLastName
        }
        if middleNameTextField.text == "" {
            guard let uwMiddleName = currentUser.middleName else { return }
            middleName = uwMiddleName
        } else {
            guard let uwMiddleName = middleNameTextField.text else { return }
            middleName = uwMiddleName
        }
        if emailTextField.text == "" {
            email = currentUser.email
        } else {
            guard let uwEmail = emailTextField.text else { return }
            email = uwEmail
        }
        if numberTextField.text == "" {
            guard let uwPhone = currentUser.phone else { return }
            phone = uwPhone
        } else {
            guard let uwPhone = numberTextField.text else { return }
            phone = uwPhone
        }
        if skypeTextField.text == "" {
            guard let uwSkype = currentUser.skype else { return }
            skype = uwSkype
        } else {
            guard let uwSkype = skypeTextField.text else { return }
            skype = uwSkype
        }
        let input = UpdateUserProfileInput(id: currentUser.id, firstName: firstName, middleName: middleName, lastName: lastName, title: currentUser.title, company: currentUser.company, email: email, phone: phone, skype: skype, signupTime: currentUser.signupTime)

        controller.updateUserProfile(input: input, completion: { error in
                                                if let error = error {
                                                print("error in updating user: \(error)")
                                                }
                                            })
        
    
        
        //TODO: Send a mutate request to GQL and update the user information with new data. Guard against empty strings in relevant locations where there is no optionality on the backend,
        //TODO: Present an alert indicating sucess or failure to update and unwind back to the AdminMain / AdminDashboard.
    }
    func updateViews() {
        guard let currentUser = currentUser else { return }
        firstNameTextField.placeholder = currentUser.firstName
        middleNameTextField.placeholder = currentUser.middleName
        lastNameTextField.placeholder = currentUser.lastName
        
        emailTextField.placeholder = currentUser.email
        skypeTextField.placeholder = currentUser.skype
        numberTextField.placeholder = currentUser.phone
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
