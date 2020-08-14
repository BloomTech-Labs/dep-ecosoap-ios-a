//
//  Property.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Property {

    let id: String
    let rooms: Int
    var name: String
    var phone, billingAddress, shippingAddress, coordinates, shippingNote, notes: String?

    init(id: String, rooms: Int, name: String, phone: String? = nil, billingAddress: String? = nil, shippingAddress: String? = nil, coordinates: String? = nil, shippingNote: String? = nil, notes: String? = nil) {
        self.id = id
        self.rooms = rooms
        self.name = name
        self.phone = phone
        self.billingAddress = billingAddress
        self.shippingAddress = shippingAddress
        self.coordinates = coordinates
        self.shippingNote = shippingNote
        self.notes = notes
    }

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let rooms = dictionary["rooms"] as? Int,
        let name = dictionary["name"] as? String else {
            print("Failed to find something")
            return nil
        }

        self.id = id
        self.rooms = rooms
        self.name = name

        self.phone = dictionary["phone"] as? String
        self.billingAddress = dictionary["billingAddress"] as? String
        self.shippingAddress = dictionary["shippingAddress"] as? String
        self.coordinates = dictionary["coordinates"] as? String
        self.shippingNote = dictionary["shippingNote"] as? String
        self.notes = dictionary["notes"] as? String
    }

}
