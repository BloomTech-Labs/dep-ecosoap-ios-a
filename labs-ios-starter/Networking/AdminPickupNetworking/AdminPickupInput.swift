//
//  AdminPickupInput.swift
//  labs-ios-starter
//
//  Created by Nonye on 11/16/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class AdminPickupInput: Input {
    
    private let collectionCode: String
    private let collectionType: String
    private let pickupStatus: String
    private let readyDate: String
    private let pickupDate: String
    private let property: String
    private let cartons: [CartonInput]// needs to be changed most likely
    private let driver: String
    private let notes: String?
    
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
