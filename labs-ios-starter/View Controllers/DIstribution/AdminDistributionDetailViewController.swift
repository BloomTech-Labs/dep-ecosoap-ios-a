//
//  AdminDistributionDetailViewController.swift
//  labs-ios-starter
//
//  Created by Brian Vilchez on 11/4/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminDistributionDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // TextFields
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var numOfSoapsTextField: UITextField!
    @IBOutlet weak var numOfBottlesTextField: UITextField!
    @IBOutlet weak var numOfLinensTextField: UITextField!
    @IBOutlet weak var photosURLTextfield: UITextField!
    @IBOutlet weak var videoURLTextField: UITextField!
    
    // UIButtons
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonCornerRadius()
        
    }
    
    private func configureButtonCornerRadius() {
        submitButton.layer.cornerRadius = 5
        editButton.layer.cornerRadius = 5
        deleteButton.layer.cornerRadius = 5
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
    }
    
}
