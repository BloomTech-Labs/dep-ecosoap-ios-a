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
    func addCartonCell(for type: Int)
}

class AddPickupCartonTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var addSoapCartonButton: UIButton!
    @IBOutlet weak var addPaperCartonButton: UIButton!
    @IBOutlet weak var addLinensCartonButton: UIButton!
    @IBOutlet weak var addBottlesCartonButton: UIButton!
    
    // MARK: - Properties
    var delegate: AddCartonCellDelegate?
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addSoapCartonButton.layer.cornerRadius = 8
        addPaperCartonButton.layer.cornerRadius = 8
        addLinensCartonButton.layer.cornerRadius = 8
        addBottlesCartonButton.layer.cornerRadius = 8
    }

    // MARK: - IBActions
    @IBAction func addSoapButtonTapped(_ sender: Any) {
        delegate?.addCartonCell(for: 0)
    }
    
    @IBAction func addPaperButtonTapped(_ sender: Any) {
        delegate?.addCartonCell(for: 1)
    }
    
    @IBAction func addLinensButtonTapped(_ sender: Any) {
        delegate?.addCartonCell(for: 2)
    }
    
    @IBAction func addBottlesButtonTapped(_ sender: Any) {
        delegate?.addCartonCell(for: 3)
    }
}
