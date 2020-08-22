//
//  Coordinates.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/19/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Coordinates {
    var latitude: Float
    var longitude: Float

    init?(dictionary: [String: Any]) {
        guard let latitude = dictionary["latitude"] as? Float,
            let longitude = dictionary["longitude"] as? Float else {
                NSLog("Error unwrapping non-optional Coordinates properties:")
                NSLog("\tLatitude: \(String(describing: dictionary["latitude"]))")
                NSLog("\tLongitude: \(String(describing: dictionary["longitude"]))")
                return nil
        }
        self.latitude = latitude
        self.longitude = longitude
    }

}
