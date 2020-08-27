//
//  CartonTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/27/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PickupCartonTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var percentageTextfield: UITextField!
    @IBOutlet weak var cartonTypeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        let imageView = UIImageView(image: UIImage(systemName: "percent"))
        imageView.tintColor = .lightGray
        percentageTextfield.rightView = imageView
        percentageTextfield.rightViewMode = .always
        percentageTextfield.textAlignment = .right
        percentageTextfield.font = .systemFont(ofSize: 17.0)
        percentageTextfield.placeholder = "0"
    }
}
