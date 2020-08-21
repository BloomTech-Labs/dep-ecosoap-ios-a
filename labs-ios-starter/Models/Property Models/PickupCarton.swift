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
    let weight: Int?

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String else {
            return nil
        }

        self.id = id
        self.product = dictionary["product"] as? String
        self.weight = dictionary["weight"] as? Int
    }
}
