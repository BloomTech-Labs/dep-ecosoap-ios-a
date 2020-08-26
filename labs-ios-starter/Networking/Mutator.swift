//
//  Mutator.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/25/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Mutator {
    static let shared = Mutator()

    private init() {

    }

    let payloads: [String: String] = [:]

    func schedulePickup(pickup: PickupInput) -> String {
        return """
        mutation {
          schedulePickup(input:{
            \(pickup.formatted)
          }) {
            pickup {
              id
              confirmationCode
              collectionType
              status
              readyDate
              pickupDate
              property {
                id
              }
              cartons {
                id
                product
                percentFull
              }
              notes
            }
            label
          }
        }

        """
    }

}
