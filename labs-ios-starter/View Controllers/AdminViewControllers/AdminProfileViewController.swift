//
//  AdminProfileViewController.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/4/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

//TODO: MVP!: Load the authenticated user profile and display relevant information in the view.


class AdminProfileViewController: UIViewController {
    
    
    
    //MARK:- Outlets

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var skypeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    let currentUser = BackendController.shared.loggedInUser
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    @IBAction func addProfileTapped(_ sender: Any) {
    }
    
    //TODO: No profile needs to be added since we are not adding anything on the app side, only updating
    @IBAction func editProfileTapped(_ sender: Any) {
//        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
    @IBAction func deleteProfileTapped(_ sender: Any) {
    }
    //TODO: Not sure if we need delete functionality here necessarily? Probably something that is done on the same website or through e-mail to server admin
    func updateViews() {
        firstNameLabel.text = currentUser.firstName
        middleNameLabel.text = currentUser.middleName
        lastNameLabel.text = currentUser.lastName
        
        emailLabel.text = currentUser.email
        skypeLabel.text = currentUser.skype
        phoneNumberLabel.text = currentUser.phone
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
