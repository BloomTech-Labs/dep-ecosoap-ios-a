//
//  Hub.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/20/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Hub {
    let id, name, email, phone: String
    var address: Address
    var coordinates: Coordinates?
    var propertiesById: [String] = []
    var workflow: String?
    var impact: ImpactStats?

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let name = dictionary["name"] as? String,
        let email = dictionary["email"] as? String,
        let phone = dictionary["phone"] as? String,
            let addContainer = dictionary["address"] as? [String: Any],
        let address = Address(dictionary: addContainer) else {
            NSLog("Error unwrapping non-optional Hub properties:")
            NSLog("\tID: \(String(describing: dictionary["id"]))")
            NSLog("\tName: \(String(describing: dictionary["name"]))")
            NSLog("\tEmail: \(String(describing: dictionary["email"]))")
            NSLog("\tPhone: \(String(describing: dictionary["phone"]))")
            NSLog("\tAddress: \(String(describing: dictionary["address"]))")
            return nil
        }

        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address

        if let coordContainer = dictionary["coordinates"] as? [String: Any],
            let coordinates = Coordinates(dictionary: coordContainer) {
            self.coordinates = coordinates
        }

        if let properties = dictionary["properties"] as? [[String: Any]] {
            for data in properties {
                if let id = data["id"] as? String {
                    self.propertiesById.append(id)
                }
            }
        }

        self.workflow = dictionary["workflow"] as? String

        if let impactContainer = dictionary["impact"] as? [String: Any] {
            self.impact = ImpactStats(dictionary: impactContainer)
        }

    }
}
