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
    
    let id: String
    let confirmationCode: String
    let collectionType: String
    let pickupStatus: String
    let readyDate: Date!
    var pickupDate: Date?
    let property: String
//    let cartons: [String]// needs to be changed most likely, should Be CartonInput
    let driver: String?
    let notes: String?
    

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let driver = dictionary["driver"] as? String,
        let confirmationCode = dictionary["confirmationCode"] as? String,
        let collectionType = dictionary["collectionType"] as? String,
        let status = dictionary["status"] as? String,
        let cartons = dictionary["cartons"] as?
            String,
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
        self.property = propertyId
        self.confirmationCode = confirmationCode
        self.collectionType = collectionType
        self.pickupStatus = status
        self.readyDate = readyDate
//        self.cartons = cartons
        self.driver = driver

        self.notes = dictionary["notes"] as? String

        if let pickupDateString = dictionary["pickupDate"] as? String {
            self.pickupDate = Date(shortDate: pickupDateString)
        }
        
        // Todo figure out how to change type array to string
//        if let cartons = dictionary["cartons"] as?
//            [String] {
//            self.cartons = cartons
//        }

//        guard let carton = dictionary["cartons"] as? [String] else {
//            return nil
//        }
//FIXIT
//        for carton in self.cartons {
//            if let id = cartons["id"] as? [String] {
//                self.cartons.append(id)
//            }
//        }

    }
    
}
