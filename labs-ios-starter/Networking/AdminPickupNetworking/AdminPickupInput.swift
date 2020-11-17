//
//  AdminPickupInput.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/16/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class AdminPickupInput: Input {
    
    let collectionCode: String
    let collectionType: String
    let pickupStatus: String
    let readyDate: String
    var pickupDate: String?
    let property: String
    let cartons: [CartonInput]// needs to be changed most likely
    let driver: String
    let notes: String?
    
    private var cartonsQuery: String {
        var string = ""
        for carton in cartons {
            string += "{ product: \(carton.product), percentFull: \(carton.percentFull) },\n"
        }
        return string
    }
    
    var formatted: String {
        var string = """
            collectionCode: \(collectionCode)
            collectionType: \(collectionType)
            pickupStatus: \(pickupStatus)
            readyDate: "\(readyDate)"
            pickupDate: "\(pickupDate)"
            property: "\(property)"
            cartons: [
              \(cartonsQuery)]
            driver: \(driver)
            notes: \(notes)

            """
        
        if let notes = notes {
            string += "notes: \"\(notes)\""
        }
        return string
    }
    
    
    init (collectionCode: String, collectionType: CollectionType, pickupStatus: PickupStatus, readyDate: Date, pickupDate: Date, property: String, cartons: [CartonInput], driver: String, notes: String?) {
        self.collectionCode = collectionCode
        self.collectionType = collectionType.rawValue
        self.pickupStatus = pickupStatus.rawValue
        let dateString = readyDate.asShortDateString()
        self.readyDate = dateString
        self.pickupDate = dateString
        self.property = property
        self.cartons = cartons
        self.driver = driver
        self.notes = notes
    }
}
