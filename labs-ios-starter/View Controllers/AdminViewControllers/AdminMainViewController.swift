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
    
    @IBOutlet weak var myProfileButton: UIButton!
    @IBOutlet weak var allHubsButton: UIButton!
    @IBOutlet weak var partnershipsButton: UIButton!
    @IBOutlet weak var corporateSponsorsButton: UIButton!
    @IBOutlet weak var ngoSponsorsButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        
    }
    
    
    
//    @IBAction func allHubsButtonTapped(_ sender: UIButton) {
////        self.performSegue(withIdentifier: "", sender: nil)
//    }
    
    @IBAction func myProfileButtonTapped(_ sender: Any) {
    }
    
    @IBAction func allHubsButtonTapped(_ sender: Any) {
        
    }
    @IBAction func partnershipsButtonTapped(_ sender: Any) {
        
    }
    @IBAction func corporateSponsorsButtonTapped(_ sender: Any) {
        
    }
    @IBAction func ngoSponsorsButtonTapped(_ sender: Any) {
        
    }
    
    
    
    
    
    
    // MARK: - Button Setup -
    func buttonSetup() {
        for button in adminDashboardButtons {
            button.setWidth(width: 190)
            button.setHeight(height: 120)
            button.layer.cornerRadius = 12.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.white.cgColor
            button.tintColor = .white
            button.titleLabel?.font = UIFont(name: "Futura", size: 15)
            
            // Shadow
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
            button.layer.shadowRadius = 5.0
            button.layer.shadowOpacity = 1.0
        }
    }
    

}

