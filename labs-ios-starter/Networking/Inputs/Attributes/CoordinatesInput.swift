//
//  CoordinatesInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class CoordinatesInput {

    private let longitude, latitude: Double?

    var formatted: String {
        var string = ""

        if let longitude = longitude {
            string += "longitude: \(longitude)\n"
        }

        if let latitude = latitude {
            string += "latitude: \(latitude)\n"
        }

        if string.isEmpty {
            return string
        } else {
            return """
            coordinates: {
                \(string)
            }
            """
        }
    }

    init(longitude: Double? = nil, latitude: Double? = nil) {
        self.longitude = longitude
        self.latitude = latitude
    }

}
