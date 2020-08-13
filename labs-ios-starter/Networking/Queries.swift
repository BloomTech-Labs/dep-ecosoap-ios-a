//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries {
    static let statsById = "{propertyById(input: {propertyId: 11}) {property {id,name,rooms,phone,billingAddress,shippingAddress,coordinates,shippingNote,notes,users {id,firstName,lastName}}}}"
    static let propertiesByUserId = """
{
  propertiesByUserId(input: {
    userId: 11
  }) {
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
    static let userById = """
{
  userById(input: {
    userId: 1
  }) {
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
