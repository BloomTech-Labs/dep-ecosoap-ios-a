//
//  CartonInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/25/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class CartonInput {
    let product: String
    let percentFull: Int

    init(product: HospitalityService, percentFull: Int) {
        self.product = product.rawValue
        self.percentFull = percentFull
    }
}
