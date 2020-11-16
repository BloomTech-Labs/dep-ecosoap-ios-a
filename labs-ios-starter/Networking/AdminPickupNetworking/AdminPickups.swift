//
//  AdminPickups.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/16/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

// TODO: Updating needed

class AdminPickups {
    
    let id, collectionType, confirmationCode, propertyId, pickupStatus: String
    var readyDate: Date
    var pickupDate: Date?
    var cartonsById: [String] = []
    var notes: String?
    var driver: String?

    init?(dictionary: [String: Any]) {

        guard let id = dictionary["id"] as? String,
        let driver = dictionary["driver"] as? String,
        let confirmationCode = dictionary["confirmationCode"] as? String,
        let collectionType = dictionary["collectionType"] as? String,
        let status = dictionary["status"] as? String,
        let property = dictionary["property"] as? [String: Any],
        let propertyId = property["id"] as? String,
        let readyDateString = dictionary["readyDate"] as? String,
            let readyDate = Date(shortDate: readyDateString) else {
            NSLog("Error unwrapping non-optional Pickup properties:")
            NSLog("\tID: \(String(describing: dictionary["id"]))")
            NSLog("\tConfirmation Code: \(String(describing: dictionary["confirmationCode"])) ")
            NSLog("\tCollection Type: \(String(describing: dictionary["collectionType"])) ")
            NSLog("\tStatus: \(String(describing: dictionary["status"])) ")
            NSLog("\tProperty Dictionary: \(String(describing: dictionary["property"]))")
            NSLog("\tReady Date: \(String(describing: dictionary["readyDate"]))")
            return nil
        }

        self.id = id
        self.propertyId = propertyId
        self.confirmationCode = confirmationCode
        self.collectionType = collectionType
        self.status = status
        self.readyDate = readyDate
        self.driver = driver

        self.notes = dictionary["notes"] as? String

        if let pickupDateString = dictionary["pickupDate"] as? String {
            self.pickupDate = Date(shortDate: pickupDateString)
        }

        guard let cartons = dictionary["cartons"] as? [[String: Any]] else {
            return nil
        }

        for carton in cartons {
            if let id = carton["id"] as? String {
                self.cartonsById.append(id)
            }
        }

    }
    
}
