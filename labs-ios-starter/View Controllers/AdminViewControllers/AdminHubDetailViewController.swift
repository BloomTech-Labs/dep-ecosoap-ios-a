//
//  AdminHubDetailViewController.swift
//  labs-ios-starter
//
//  Created by Patrick Millet on 11/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
//TODO: MVP - Implement Admin Hub Profile view/UI and display necessary data
//TODO: MVP - Segue to a Hub Update screen for the tapped Hub (collection view?)
//TODO: Stretch - Filter hubs / search hubs


class AdminHubDetailViewController: UIViewController {
    @IBOutlet weak var hubProfileButton: UIButton!
    @IBOutlet weak var adminPickupButton: UIButton!
    @IBOutlet weak var teamMembersButton: UIButton!
    @IBOutlet weak var distributionButton: UIButton!
    @IBOutlet weak var productReportButton: UIButton!
    
    
    var hub: Hub?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hubProfileSegue" {
            guard let hubProfileViewController = segue.destination as? AdminHubDetailViewController else { return }
            hubProfileViewController.hub = self.hub
            
            
        }
        else if segue.identifier == "adminPickupSegue" {
            guard let adminPickupVC = segue.destination as? AdminPickupTableVC else { return }
//            adminPickupVC.hub = self.hub
            
        
            
        }
        else if segue.identifier == "teamMembersSegue" {
            guard let teamMembersVC = segue.destination as? AdminTeamMembersViewController else { return }
//            teamMembersVC.hub = self.hub
            
            
        }
        else if segue.identifier == "adminDistributionSegue" {
            guard let distributionVC = segue.destination as? AdminDistributionsViewController else { return }
            distributionVC.hub = self.hub
            
            
        }
        else if segue.identifier == "productReportSegue" {
            guard let productReportVC = segue.destination as? AdminProductionReportViewController else { return }
//            productReportVC.hub = self.hub
            
            
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

}
