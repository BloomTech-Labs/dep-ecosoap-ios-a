//
//  ImpactStatisticsIndividualCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/18/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ImpactStatisticsIndividualCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var property: Property? {
        didSet {
            setupViews()
        }
    }
    
    var indexPath: IndexPath?
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        guard let indexPath = indexPath, let propertyImpact = property?.impact else { return }
        
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor(named: "Panel System Background")?.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.25
        self.layer.masksToBounds = false
        
        if indexPath.row == 1 {
            titleLabel.text = "Soap"
            imageView.image = UIImage(named: "ESB Soap Icon")
            amountLabel.text = "\(propertyImpact.soapRecycled ?? 0)g"
            descriptionLabel.text = "Recycled"
        } else if indexPath.row == 2 {
            titleLabel.text = "Linens"
            imageView.image = UIImage(named: "ESB Linens Icon")
            amountLabel.text = "\(propertyImpact.linensRecycled ?? 0)g"
            descriptionLabel.text = "Recycled"
        } else if indexPath.row == 3 {
            titleLabel.text = "Bottles"
            imageView.image = UIImage(named: "ESB Bottles Icon")
            amountLabel.text = "\(propertyImpact.bottlesRecycled ?? 0)g"
            descriptionLabel.text = "Recycled"
        } else if indexPath.row == 4 {
            titleLabel.text = "Paper"
            imageView.image = UIImage(named: "ESB Paper Icon")
            amountLabel.text = "\(propertyImpact.paperRecycled ?? 0)g"
            descriptionLabel.text = "Recycled"
        } else if indexPath.row == 5 {
            titleLabel.text = "People"
            imageView.tintColor = UIColor(named: "ESB Orange")
            imageView.image = UIImage(systemName: "person.3.fill")
            amountLabel.text = "\(propertyImpact.peopleServed ?? 0)"
            descriptionLabel.text = "Served"
        } else if indexPath.row == 6 {
            titleLabel.text = "Women"
            imageView.tintColor = UIColor(named: "ESB Aqua")
            imageView.image = UIImage(named: "ESB Woman Icon")
            amountLabel.text = "\(propertyImpact.womenEmployed ?? 0)"
            descriptionLabel.text = "Employed"
        }
    }
}
