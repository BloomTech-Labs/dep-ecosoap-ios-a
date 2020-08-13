//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries {
    static let statsById = """
    query {
      impactStatsByPropertyId(input: {
        propertyId: 11
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
