//
//  AddressInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class AddressInput {
    private let address1, address2, address3, city, state, postalCode, country: String?

    var formatted: String {
        var string = ""

        if let address1 = address1 {
            string += "address1: \"\(address1)\" \n"
        }
        if let address2 = address2 {
            string += "address2: \"\(address2)\" \n"
        }
        if let address3 = address3 {
            string += "address3: \"\(address3)\" \n"
        }
        if let city = city {
            string += "city: \"\(city)\" \n"
        }
        if let state = state {
            string += "state: \"\(state)\" \n"
        }
        if let postalCode = postalCode {
            string += "postalCode: \"\(postalCode)\" \n"
        }
        if let country = country {
            string += "country: \"\(country)\" \n"
        }

        if string.isEmpty {
            return string
        } else {
            return """
            address: {
                \(string)
            }
            """
        }
    }

    init(address1: String? = nil,
         address2: String? = nil,
         address3: String? = nil,
         city: String? = nil,
         state: String? = nil,
         postalCode: String? = nil,
         country: String? = nil) {

        self.address1 = address1
        self.address2 = address2
        self.address3 = address3
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
}
