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
            setupViews()
        }
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 12
    }
    
    private func setupViews() {
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
