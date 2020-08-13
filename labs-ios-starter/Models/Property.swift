//
//  Property.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Property {
    
    let id: Int
    let rooms: Int
    var name, propertyType: String
    var phone, billingAddress, shippingAddress, coordinates, shippingNote, notes: String?
    
    init(id: Int, rooms: Int, name: String, propertyType: String, phone: String? = nil, billingAddress: String? = nil, shippingAddress: String? = nil, coordinates: String? = nil, shippingNote: String? = nil, notes: String? = nil) {
        self.id = id
        self.rooms = rooms
        self.name = name
        self.propertyType = propertyType
        self.phone = phone
        self.billingAddress = billingAddress
        self.shippingAddress = shippingAddress
        self.coordinates = coordinates
        self.shippingNote = shippingNote
        self.notes = notes
    }
}
