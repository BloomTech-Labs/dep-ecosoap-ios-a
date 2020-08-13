//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries {
    
    static func statsById(propertyId: Int = 11) -> String {
        return "{propertyById(input: {propertyId: \(propertyId)}) {property {id,name,rooms,phone,billingAddress,shippingAddress,coordinates,shippingNote,notes,users {id,firstName,lastName}}}}"
    }
    
    static func propertiesByUserId(userId: Int = 11) -> String {
        return """
        {
        propertiesByUserId(input: { userId: \(userId) }) {
            properties {
                id,
                name,
                rooms,
                phone,
                billingAddress,
                shippingAddress,
                coordinates,
                shippingNote,
                notes,
            users {
                id,
                firstName,
                lastName
              }
            }
          }
        }
        """
    }

    static func userById(userId: Int = 1) -> String {
        return """
        {
          userById(input: { userId: \(userId) }) {
            user {
              id,
              firstName,
              middleName,
              lastName,
              title,
              company,
              email,
              phone,
              skype,
              address,
              signupTime,
              properties {
                id,
                name,
                rooms,
                phone,
                billingAddress,
                shippingAddress,
                coordinates,
                shippingNote,
                notes
              }
            }
          }
        }
        """
    }
}
