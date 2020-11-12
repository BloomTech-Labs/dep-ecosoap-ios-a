//
//  AdminPickupsViewController.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminPickupsViewController: UIViewController {

    @IBOutlet weak var pickupConfirmationCode: UILabel!
    @IBOutlet weak var pickupDate: UILabel!
    
    @IBOutlet weak var pickupStatus: UILabel!
    
    @IBOutlet weak var collectionType: UITextField!
    @IBOutlet weak var pickupDriver: UILabel!
    @IBOutlet weak var pickupCarton: UILabel!
    
    @IBOutlet weak var pickupNotes: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - ACTIONS
    
    @IBAction func updatePickupTapped(_ sender: Any) {
    }
    
    @IBAction func deletePickupTapped(_ sender: Any) {
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
