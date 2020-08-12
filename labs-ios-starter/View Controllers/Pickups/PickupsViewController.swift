//
//  PickupsViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PickupsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var schedulePickupView: UIView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        schedulePickupView.layer.cornerRadius = 8.0
        schedulePickupView.layer.shadowColor = UIColor.lightGray.cgColor
        schedulePickupView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        schedulePickupView.layer.shadowRadius = 5.0
        schedulePickupView.layer.shadowOpacity = 0.25
        schedulePickupView.layer.masksToBounds = true
    }
}
