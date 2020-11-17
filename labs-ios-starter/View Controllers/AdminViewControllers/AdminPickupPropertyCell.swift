//
//  AdminPickupPropertyCell.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/17/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminPickupPropertyCell: UITableViewCell {
    
    @IBOutlet weak var pickupName: UILabel!
    @IBOutlet weak var collectionType: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
