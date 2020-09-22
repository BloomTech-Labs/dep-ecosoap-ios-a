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
        
    // MARK: - Private Methods
    private func setupViews() {
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor(named: "Panel System Background")?.cgColor
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
            imageView.image = UIImage(named: "ESB Property")
        } else if indexPath.row == 2 {
            textLabel.text = "Settings"
            imageView.image = UIImage(systemName: "gear")
        } else if indexPath.row == 3 {
            textLabel.text = "Impact\nStatistics"
            imageView.image = UIImage(systemName: "chart.bar.fill")
        }
    }
}

