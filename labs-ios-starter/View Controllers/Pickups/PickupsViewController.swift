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
    @IBOutlet weak var schedulePickupBackgroundView: UIView!
    @IBOutlet weak var viewPickupsBackgroundView: UIView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        schedulePickupBackgroundView.layer.cornerRadius = 8.0
        schedulePickupBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        schedulePickupBackgroundView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        schedulePickupBackgroundView.layer.shadowRadius = 5.0
        schedulePickupBackgroundView.layer.shadowOpacity = 0.25
        schedulePickupBackgroundView.layer.masksToBounds = true
        
        viewPickupsBackgroundView.layer.cornerRadius = 8.0
        viewPickupsBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        viewPickupsBackgroundView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        viewPickupsBackgroundView.layer.shadowRadius = 5.0
        viewPickupsBackgroundView.layer.shadowOpacity = 0.25
        viewPickupsBackgroundView.layer.masksToBounds = true
        
    }
}
