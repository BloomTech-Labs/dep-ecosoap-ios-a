//
//  HubAdminMainTableViewCell.swift
//  labs-ios-starter
//
//  Created by Harmony Radley on 10/8/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class HubAdminMainTableViewCell: UITableViewCell {

    @IBOutlet var dateCell: HubAdminMainTableViewCell!

    @IBOutlet var productionReportDate: HubAdminMainTableViewCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
