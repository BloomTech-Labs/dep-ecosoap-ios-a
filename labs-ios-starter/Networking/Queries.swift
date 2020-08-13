//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries {
    static let statsById = "{propertyById(input: {propertyId: 2}) {property {id,name,rooms,phone,billingAddress,shippingAddress,coordinates,shippingNote,notes,users {id,firstName,lastName}}}}"
}
