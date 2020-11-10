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
    
    @IBOutlet var adminDashboardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
    }
    
    @IBAction func productionReportButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "", sender: nil)
        
        // Creates illusion of animation when button is tapped
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func hubProfilesButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "", sender: nil)
        
        // Creates illusion of animation when button is tapped
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func teamMembersButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "", sender: nil)
        
        // Creates illusion of animation when button is tapped
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func pickUpsButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "", sender: nil)
        
        // Creates illusion of animation when button is tapped
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "", sender: nil)
        
        // Creates illusion of animation when button is tapped
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Button Setup -
    func buttonSetup() {
        for button in adminDashboardButtons {
            button.setWidth(width: 190)
            button.setHeight(height: 120)
            button.backgroundColor = UIColor(red: 18/255, green: 89/255, blue: 11/255, alpha: 1.0)
            button.layer.cornerRadius = 12.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.white.cgColor
            button.setTitleColor(UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1.0), for: .normal)
            button.titleLabel?.textColor = .black
            button.titleLabel?.font = UIFont(name: "Futura", size: 20)
            
            // Shadow
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
            button.layer.shadowRadius = 5.0
            button.layer.shadowOpacity = 1.0
        }
    }

}
