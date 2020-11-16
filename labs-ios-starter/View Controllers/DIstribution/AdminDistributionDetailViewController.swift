//
//  AdminDistributionDetailViewController.swift
//  labs-ios-starter
//
//  Created by Dahna on 11/10/20.
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
    
    var distribution: Distribution?

    
    //MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonCornerRadius()
        isEditing = false
        setupEditing()
        populateViews()
    }
    
    
    //MARK: - Actions
    @IBAction func editButtonTapped(_ sender: UIButton) {
        isEditing.toggle()
    }
    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
    }
    
    
    //MARK: - Methods
    private func populateViews() {
        guard let distribution = distribution else {
            dateTextField.text = Date().asShortDateString()
            numOfSoapsTextField.text = "0"
            numOfBottlesTextField.text = "0"
            numOfLinensTextField.text = "0"
            photosURLTextfield.placeholder = "URL"
            videoURLTextField.placeholder = "URL"
            return
        }
        
        dateTextField.text = distribution.date.asShortDateString()
        if let numSoaps = distribution.soapDistributed {
            numOfSoapsTextField.text = String(numSoaps)
        } else {
            numOfLinensTextField.text = "0"
        }
        
        if let numBottles = distribution.bottlesDistributed {
            numOfBottlesTextField.text = String(numBottles)
        } else {
            numOfBottlesTextField.text = "0"
        }
       
        if let numLinens = distribution.linensDistributed {
            numOfLinensTextField.text = String(numLinens)
        } else {
            numOfLinensTextField.text = "0"
        }
        
        var photosURLs = """
        """
        
        if let photos = distribution.photos {
            for url in photos {
                photosURLs.append("\(url)\n")
            }
        }
        photosURLTextfield.text = photosURLs
        
        var videosURLs = """
        """
        
        if let videos = distribution.videos {
            for url in videos {
                videosURLs.append("\(url)\n")
            }
        }
        videoURLTextField.text = videosURLs
    }
    
    private func setupEditing() {
        dateTextField.isUserInteractionEnabled = isEditing
        numOfSoapsTextField.isUserInteractionEnabled = isEditing
        numOfBottlesTextField.isUserInteractionEnabled = isEditing
        numOfLinensTextField.isUserInteractionEnabled = isEditing
        photosURLTextfield.isUserInteractionEnabled = isEditing
        videoURLTextField.isUserInteractionEnabled = isEditing
    }
    
    private func configureButtonCornerRadius() {
        submitButton.layer.cornerRadius = 5
        editButton.layer.cornerRadius = 5
        deleteButton.layer.cornerRadius = 5
    }
}
