//
//  AdminPickupTableViewCell.swift
//  labs-ios-starter
//
//  Created by Patrick Millet on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminPickupTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var pickupTitle: UILabel!
    @IBOutlet weak var pickupReadyDate: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
