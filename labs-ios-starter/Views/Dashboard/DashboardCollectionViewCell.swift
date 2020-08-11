//
//  DashboardCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Properties
    var indexPath: IndexPath? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Public Methods
    func updateShadowOnSelect() {
        UIView.animate(withDuration: 0.2) {
            self.layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
            self.layer.shadowRadius = 10.0
            self.layer.shadowOpacity = 0.75
        }
    }
    
    func updateShadowOnDeselect() {
        UIView.animate(withDuration: 0.2) {
            self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            self.layer.shadowRadius = 5.0
            self.layer.shadowOpacity = 0.25
        }
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        self.layer.cornerRadius = 12.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.25
        self.layer.masksToBounds = false
    }
    
    private func updateViews() {
        guard let indexPath = indexPath else { return }
        
        if indexPath.row == 0 {
            textLabel.text = "Profile"
            imageView.image = UIImage(systemName: "person.fill")
        } else if indexPath.row == 1 {
            textLabel.text = "Properties"
            imageView.image = UIImage(systemName: "house.fill")
        } else if indexPath.row == 2 {
            textLabel.text = "Payment History"
            imageView.image = UIImage(systemName: "creditcard.fill")
        } else if indexPath.row == 3 {
            textLabel.text = "Settings"
            imageView.image = UIImage(systemName: "gear")
        }
    }
}

