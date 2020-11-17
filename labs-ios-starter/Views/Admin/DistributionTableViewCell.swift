//
//  DistributionTableViewCell.swift
//  labs-ios-starter
//
//  Created by Cody Morley on 11/16/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class DistributionTableViewCell: UITableViewCell {
    @IBOutlet weak var partnerNameLabel: UILabel!
    @IBOutlet weak var distributionDate: UILabel!
    
    var distribution: Distribution? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let distribution = distribution else { return }
        partnerNameLabel.text = distribution.partner?.name ?? "No Distribution Partner Assigned."
        distributionDate.text = distribution.date.asShortDateString()
    }
}
