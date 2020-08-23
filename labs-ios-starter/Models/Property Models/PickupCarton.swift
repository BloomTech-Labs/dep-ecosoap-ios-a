//
//  PickupCarton.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/21/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class PickupCarton {
    let id: String
    let product: String?
    let percentFull: Int?

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String else {
            NSLog("Error unwrapping non-optional PickupCarton properties:")
            NSLog("\tId: \(String(describing: dictionary["id"]))")
            return nil
        }

        self.id = id
        self.product = dictionary["product"] as? String
        self.percentFull = dictionary["percentFull"] as? Int
    }
}
