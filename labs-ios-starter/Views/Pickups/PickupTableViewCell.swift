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
    var pickup: Pickup? {
        didSet {
            
        }
    }
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Private Methods
    private func updateViews() {
        guard let pickup = pickup else { return }
        print(pickup.status)
        
        if pickup.status == "COMPLETE" {
            self.statusLabel.text = "Complete"
            self.statusImageView.image = UIImage(systemName: "checkmark.seal")
            self.statusImageView.tintColor = UIColor(named: .colorESBGreen)
        } else if pickup.status == "OUT_FOR_PICKUP" {
            self.statusLabel.text = "Out for Pickup"
            self.statusImageView.image = UIImage(systemName: "checkmark.seal")
            self.statusImageView.tintColor = UIColor(named: .colorESBGreen)
        } else if pickup.status == "CANCELLED" {
            self.statusLabel.text = "Canceled"
            self.statusImageView.image = UIImage(systemName: "xmark.seal.fill")
            self.statusImageView.tintColor = UIColor(named: .colorESBRed)
        } else if pickup.status == "SUBMITTED" {
            self.statusLabel.text = "Sumbitted"
            self.statusImageView.image = UIImage(systemName: "checkmark.seal")
            self.statusImageView.tintColor = UIColor(named: .colorESBGreen)
        }
    }

}
