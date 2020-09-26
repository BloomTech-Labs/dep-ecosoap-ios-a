//
//  PickupTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/19/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PickupTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var controller: BackendController?
    var dateFormatter: DateFormatter?
    var pickup: Pickup? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Private Methods
    private func updateViews() {
        guard let pickup = pickup else { return }
        
        if pickup.status == "COMPLETE" {
            statusLabel.text = "Complete"
            statusImageView.image = UIImage(systemName: "checkmark.seal.fill")
            statusImageView.tintColor = UIColor(named: .colorESBGreen)
        } else if pickup.status == "OUT_FOR_PICKUP" {
            statusLabel.text = "Out for Pickup"
            statusImageView.image = UIImage(systemName: "checkmark.seal")
            statusImageView.tintColor = UIColor(named: .colorESBGreen)
        } else if pickup.status == "CANCELLED" {
            statusLabel.text = "Canceled"
            statusLabel.textColor = UIColor(named: .colorESBRed)
            statusImageView.image = UIImage(systemName: "xmark.seal.fill")
            statusImageView.tintColor = UIColor(named: .colorESBRed)
        } else if pickup.status == "SUBMITTED" {
            statusLabel.text = "Sumbitted"
            statusImageView.image = UIImage(systemName: "checkmark.seal")
            statusImageView.tintColor = UIColor(named: .colorESBGreen)
        }
        guard let controller = controller else { return }
        let property = controller.properties[pickup.propertyId]
        titleLabel.text = property?.name
        print(pickup.pickupDate)
        if let pickupDate = pickup.pickupDate, let dateString = dateFormatter?.string(from: pickupDate) {
            descriptionLabel.text = "Complete on \(dateString)"
        }
    }

}
