//
//  CreateReportVC.swift
//  labs-ios-starter
//
//  Created by Brian Vilchez on 11/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class CreateReportVC: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var barsMadeTextField: UITextField!
    @IBOutlet weak var soapsMadeTextfield: UITextField!
    @IBOutlet weak var hoursWorkedTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }
    
}
