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
    
    // MARK: - Properties
    var indexPath: IndexPath? {
        didSet {
            updateViews()
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
        guard let indexPath = indexPath else { return }
        
        if indexPath.row == 1 {
            self.statusLabel.text = "Active"
            self.statusImageView.image = UIImage(systemName: "checkmark.seal")
        } else if indexPath.row == 2 {
            self.statusLabel.text = "Canceled"
            self.statusImageView.image = UIImage(systemName: "xmark.seal.fill")
            self.statusImageView.tintColor = UIColor(named: "ESB Red")
            self.statusLabel.textColor = UIColor(named: "ESB Red")
        }
    }

}
