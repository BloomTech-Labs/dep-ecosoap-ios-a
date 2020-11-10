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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        //TODO: Send a mutate request to GQL and update the user information with new data. Guard against empty strings in relevant locations where there is no optionality on the backend,
        //TODO: Present an alert indicating sucess or failure to update and unwind back to the AdminMain / AdminDashboard.
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
