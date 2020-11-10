//
//  AdminMainViewController.swift
//  labs-ios-starter
//
//  Created by Patrick Millet on 11/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminMainViewController: UIViewController {
  
    @IBOutlet var adminDashboardButtons: [DashboardButton]!
    
    //MARK: - Outlets
    
    @IBOutlet weak var hubProfileButton: UIButton!
    @IBOutlet weak var adminPickupButton: UIButton!
    @IBOutlet weak var teamMembersButton: UIButton!
    @IBOutlet weak var distributionButton: UIButton!
    @IBOutlet weak var productReportButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
    }
    
    @IBAction func productionReportButtonTapped(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "", sender: nil)
    }
    
    @IBAction func hubProfilesButtonTapped(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "", sender: nil)
    }
    
    @IBAction func teamMembersButtonTapped(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "", sender: nil)
    }
    
    @IBAction func pickUpsButtonTapped(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "", sender: nil)
    }
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "", sender: nil)
    }
    
    
    // MARK: - Button Setup -
    func buttonSetup() {
        for button in adminDashboardButtons {
            button.setWidth(width: 190)
            button.setHeight(height: 120)
            button.layer.cornerRadius = 12.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.white.cgColor
            button.titleLabel?.font = UIFont(name: "Futura", size: 20)
            
            // Shadow
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
            button.layer.shadowRadius = 5.0
            button.layer.shadowOpacity = 1.0
        }
    }

}

