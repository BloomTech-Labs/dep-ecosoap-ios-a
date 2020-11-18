//
//  AdminMainViewController.swift
//  labs-ios-starter
//
//  Created by Patrick Millet on 11/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminMainViewController: UIViewController {
    
    
    var controller = BackendController.shared
    
    
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var myProfileButton: DashboardButton!
    @IBOutlet weak var allHubsButton: DashboardButton!
    @IBOutlet weak var partnershipsButton: DashboardButton!
    @IBOutlet weak var corporateSponsorsButton: DashboardButton!
    @IBOutlet weak var ngoSponsorsButton: DashboardButton!
    
    lazy var adminButtons: [DashboardButton] = [myProfileButton, allHubsButton, partnershipsButton, corporateSponsorsButton, ngoSponsorsButton]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        controller.getAllHubs { (error) in
            if let error = error {
                print("\(error): Error getting all hubs")
                return
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        for button in adminButtons {
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

