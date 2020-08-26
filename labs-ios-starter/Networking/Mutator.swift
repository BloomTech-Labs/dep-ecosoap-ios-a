//
//  Mutator.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/25/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Mutator: Request {

    var body: String

    var payload: ResponseModel

    var name: String

    private static let collection = [MutationName.schedulePickup: Mutator.schedulePickup]

    private static let payloads: [MutationName: ResponseModel] = [.schedulePickup: .pickup]

    init?(name: MutationName, input: Input) {
        guard let function = Mutator.collection[name] else {
            NSLog("Couldn't find this mutation in the collection. Check your implementation.")
            return nil
        }

        guard let body = function(input) else {
            return nil
        }

        guard let payload = Mutator.payloads[name] else {
            NSLog("Couldn't find a matching payload name. Check your implementation.")
            return nil
        }
        self.body = body
        self.payload = payload
        self.name = name.rawValue
    }

    private static func schedulePickup(input: Input) -> String? {
        guard let pickup = input as? PickupInput else {
            NSLog("Couldn't cast input to PickupInput. Please make sure your input matches the mutation's required input.")
            return nil
        }
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
