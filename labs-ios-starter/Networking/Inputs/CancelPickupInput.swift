//
//  CancelPickupInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class CancelPickupInput: Input {

    private let pickupId: String
    private let confirmationCode: String

    var formatted: String {
        let string = """
        pickupId: \"\(pickupId)\"
        confirmationCode: \"\(confirmationCode)\"
        """
        return string
    }

    init(pickupId: String, confirmationCode: String) {
        self.pickupId = pickupId
        self.confirmationCode = confirmationCode
    }


}
