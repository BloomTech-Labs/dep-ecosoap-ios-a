//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries {

    static let shared = Queries()

    enum Key {
        case userById
        case propertiesByUserId
        case propertyById
        case impactStatsByPropertyId
    }

    func statsById(propertyId: String = "11") -> String {
        return "{propertyById(input: {propertyId: \(propertyId)}) {property {id,name,rooms,phone,billingAddress,shippingAddress,coordinates,shippingNote,notes,users {id,firstName,lastName}}}}"
    }
    
    static func propertiesByUserId(userId: String = "11") -> String {
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

    static func userById(userId: String = "1") -> String {
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

    static func propertyById(propertyId: String = "11") -> String {
        return """
        {
          propertyById(input: {
            propertyId: \(propertyId)
          }) {
            property {
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

    static func impactStatsByPropertyId(propertyId: String = "11") -> String {
        return """
        query {
          impactStatsByPropertyId(input: {
            propertyId: \(propertyId)
          }) {
            impactStats {
              soapRecycled
              linensRecycled
              bottlesRecycled
              paperRecycled
              peopleServed
              womenEmployed
            }
          }
        }
        """
    }
}
