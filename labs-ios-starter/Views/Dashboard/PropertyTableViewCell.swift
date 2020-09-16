//
//  PropertyTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 9/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: - Properties
    var property: Property? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Private Methods
    private func updateViews() {
        guard let property = property else { return }
        titleLabel.text = property.name
        addressLabel.text = property.shippingAddress?.address1
    }
}
