//
//  Pickup.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Pickup {
    
    let id: String
    let confirmationCode, readyDate, pickupDate, notes: String
    let collectionType: String
    var status: String
    
    init(id: String, confirmationCode: String, readyDate: String, pickupDate: String, notes: String, collectionType: String, status: String) {
        self.id = id
        self.confirmationCode = confirmationCode
        self.readyDate = readyDate
        self.pickupDate = pickupDate
        self.notes = notes
        self.collectionType = collectionType
        self.status = status
    }

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let confirmationCode = dictionary["confirmationCode"] as? String,
        let collectionType = dictionary["collectionType"] as? String,
        let status = dictionary["status"] as? String,
        let readyDate = dictionary["readyDate"] as? String,
        let pickupDate = dictionary["pickupDate"] as? String,
        let notes = dictionary["notes"] as? String else {
            NSLog("Error unwrapping optional Pickup properties:")
            NSLog("\tID: \(String(describing: dictionary["id"])) ")
            NSLog("\tConfirmation Code: \(String(describing: dictionary["confirmationCode"])) ")
            NSLog("\tCollection Type: \(String(describing: dictionary["collectionType"])) ")
            NSLog("\tStatis: \(String(describing: dictionary["status"])) ")
            NSLog("\tReady Date: \(String(describing: dictionary["readyDate"])) ")
            NSLog("\tPickup Date: \(String(describing: dictionary["pickupDate"])) ")
            NSLog("\tNotes: \(String(describing: dictionary["notes"])) ")
            return nil
        }

        self.id = id
        self.confirmationCode = confirmationCode
        self.readyDate = readyDate
        self.pickupDate = pickupDate
        self.notes = notes
        self.collectionType = collectionType
        self.status = status
    }
    
}
