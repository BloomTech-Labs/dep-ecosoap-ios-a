//
//  AdminMainViewController.swift
//  labs-ios-starter
//
//  Created by Patrick Millet on 11/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

//TODO: This is the APEX location where all the segues to sub-sections are stored. Create buttons and segue logic to handle transition to sub-sections.
//TODO: MVP: We need the segue to AdminProfileVC -> AdminDetailVC (to edit user info)

class AdminMainViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var hubProfileButton: UIButton!
    @IBOutlet weak var adminPickupButton: UIButton!
    @IBOutlet weak var teamMembersButton: UIButton!
    @IBOutlet weak var distributionButton: UIButton!
    @IBOutlet weak var productReportButton: UIButton!
    
    
    // MARK: - Actions
    
    @IBAction func hubProfileButtonTapped(_ sender: Any) {
    }
    
    @IBAction func adminPickupButtonTapped(_ sender: Any) {
    }
    
    @IBAction func teamMembersButtonTapped(_ sender: Any) {
    }
    
    @IBAction func distributionButtonTapped(_ sender: Any) {
    }
    
    @IBAction func productReportButtonTapped(_ sender: Any) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
