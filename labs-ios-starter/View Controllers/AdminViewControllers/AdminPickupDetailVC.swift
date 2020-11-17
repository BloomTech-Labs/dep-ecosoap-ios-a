//
//  AdminPickupDetailVC.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminPickupDetailVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var pickupConfirmationCode: UITextField!
    @IBOutlet weak var pickupDate: UITextField!
    @IBOutlet weak var pickupStatus: UITextField!
    @IBOutlet weak var collectionType: UITextField!
    @IBOutlet weak var pickupDriver: UITextField!
    @IBOutlet weak var pickupCarton: UITextField!
    @IBOutlet weak var pickupNotes: UITextView!
    
    var adminPickups: AdminPickups?
    var controller = BackendController.shared
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - ACTIONS
    
    @IBAction func saveButtonTapped(_ sender: Any) {
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
