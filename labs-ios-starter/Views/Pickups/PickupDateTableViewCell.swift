//
//  PickupDateTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PickupDateTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var dateTextField: UITextField!
    
    // MARK: - Properties
    let picker = UIDatePicker()
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateTextField.inputView = picker
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
