//
//  PickupInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/25/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class PickupInput: Input {
    private let collectionType: String
    private let status: String
    private let readyDate: String
    private let propertyId: String
    private let cartons: [CartonInput]
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
            collectionType: \(collectionType)
            status: \(status)
            readyDate: "\(readyDate)"
            propertyId: "\(propertyId)"
            cartons: [
              \(cartonsQuery)]

            """
        if let notes = notes {
            string += "notes: \"\(notes)\""
        }
        return string
    }

    init (collectionType: CollectionType, status: Status, readyDate: Date, propertyId: String, cartons: [CartonInput], notes: String?) {
        self.collectionType = collectionType.rawValue
        self.status = status.rawValue
        let dateString = readyDate.asShortDateString()
        self.readyDate = dateString
        self.propertyId = propertyId
        self.cartons = cartons
        self.notes = notes
    }
}
