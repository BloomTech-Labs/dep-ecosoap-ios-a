//
//  AdminProfileViewController.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/4/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminProfileViewController: UIViewController {
    
    //MARK:- Outlets

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var skypeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    @IBAction func addProfileTapped(_ sender: Any) {
    }
    @IBAction func editProfileTapped(_ sender: Any) {
    }
    @IBAction func deleteProfileTapped(_ sender: Any) {
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
