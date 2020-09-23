//
//  PickupContentsTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

enum CartonTypes: Int {
    case soap = 0
    case paper = 1
    case linens = 2
    case bottles = 3
}

protocol AddCartonCellDelegate: AnyObject {
    func addCartonCell()
}

class AddPickupCartonTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var addCartonButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: AddCartonCellDelegate?
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addCartonButton.layer.cornerRadius = 8
    }

    // MARK: - IBActions
    
    @IBAction func addCartonButtonTapped(_ sender: Any) {
        delegate?.addCartonCell()
    }
}
