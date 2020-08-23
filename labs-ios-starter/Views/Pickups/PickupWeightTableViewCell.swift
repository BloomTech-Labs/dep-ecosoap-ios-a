//
//  PickupWeightTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PickupWeightTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var weightTextField: UITextField!
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        weightTextField.textAlignment = .right
        weightTextField.font = .systemFont(ofSize: 17.0)
    }
}
