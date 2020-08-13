//
//  Pickup.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Pickup {
    
    let id: Int
    let confirmationCode, readyDate, pickupDate, notes: String
    let collectoinType: String
    var status: String
    
    internal init(id: Int, confirmationCode: String, readyDate: String, pickupDate: String, notes: String, collectoinType: String, status: String) {
        self.id = id
        self.confirmationCode = confirmationCode
        self.readyDate = readyDate
        self.pickupDate = pickupDate
        self.notes = notes
        self.collectoinType = collectoinType
        self.status = status
    }
    
}
