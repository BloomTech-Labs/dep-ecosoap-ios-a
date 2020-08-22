//
//  Address.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/19/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Address {
    var address1, address2, address3, state, postalCode: String?
    var city: String
    var formattedAddress: [String]?

    init?(dictionary: [String: Any]) {
        guard let city = dictionary["city"] as? String else {
            NSLog("Error unwrapping non-optional Address properties:")
            NSLog("\tCity: \(String(describing: dictionary["city"]))")
            return nil
        }
        self.city = city

        self.address1 = dictionary["address1"] as? String
        self.address2 = dictionary["address2"] as? String
        self.address3 = dictionary["address3"] as? String
        self.state = dictionary["state"] as? String
        self.postalCode = dictionary["postalCode"] as? String
        self.formattedAddress = dictionary["formattedAddress"] as? [String]
    }
}
