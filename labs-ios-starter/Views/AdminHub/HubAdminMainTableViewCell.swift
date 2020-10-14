//
//  HubAdminMainTableViewCell.swift
//  labs-ios-starter
//
//  Created by Harmony Radley on 10/8/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class HubAdminMainTableViewCell: UITableViewCell {

    // Date Button 
    @IBOutlet weak var dateLabel: UILabel!
    
   
    
    var productionReports: HubDailyProduction? {
        didSet {
            updateView()
        }
    }
    func updateView() {
        if let productionReports = productionReports {
            dateLabel.text = productionReports.date
        }
    }
    

    }

