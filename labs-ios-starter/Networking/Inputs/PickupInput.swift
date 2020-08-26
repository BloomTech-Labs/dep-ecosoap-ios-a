//
//  PickupInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/25/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class PickupInput {
    let collectionType: String
    let status: String
    let readyDate: String
    let propertyId: String
    let cartons: [CartonInput]

    init (collectionType: CollectionType, status: Status, readyDate: String, propertyId: String, cartons: [CartonInput]) {
        self.collectionType = collectionType.rawValue
        self.status = status.rawValue
        self.readyDate = readyDate
        self.propertyId = propertyId
        self.cartons = cartons
    }
}
