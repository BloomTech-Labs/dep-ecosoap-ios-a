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
    var controller = BackendController.shared
    
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
        setupEditing()
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let distribution = distribution else { return }
        guard let dateString = dateTextField.text,
              dateString != "",
              let date = Date(shortDate: dateString),
              let numSoapsString = numOfSoapsTextField.text,
              numSoapsString != "",
              let numSoaps = Int(numSoapsString),
              let numBottlesString = numOfBottlesTextField.text,
              numBottlesString != "",
              let numBottles = Int(numBottlesString),
              let numLinensString = numOfLinensTextField.text,
              numLinensString != "",
              let numLinens = Int(numLinensString),
              let photos = photosURLTextfield.text ?? "",
              let videos = videoURLTextField.text ?? "" else {
            NSLog("All fields must be filled to send data to server")
            return
        }
        
        var allPhotos = Array<String>()
        var allVideos = Array<String>()
        
        if var photoPackage = distribution.photos {
            photoPackage.append(photos)
            allPhotos = photoPackage
        }
        if var videoPackage = distribution.videos {
            videoPackage.append(videos)
            allVideos = videoPackage
        }
        
        let distroToSend = UpdateDistributionInput(id: distribution.id,
                                                   hub: distribution.hub,
                                                   date: date,
                                                   partner: distribution.partner,
                                                   soapDistributed: numSoaps,
                                                   bottlesDistributed: numBottles,
                                                   linensDistributed: numLinens,
                                                   photos: allPhotos,
                                                   videos: allVideos,
                                                   notes: distribution.notes)
        
        controller.updateDistribution(input: distroToSend) { (error) in
            if let error = error {
                NSLog("Something went wrong updating distribution info: \n \(error) \n \(error.localizedDescription)")
                return
            }
        }
        
        dismiss(animated: true, completion: nil)
        
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
