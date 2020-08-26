//
//  CreatePaymentInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class CreatePaymentInput: Input {

    let amountPaid: Int
    let date: Date
    let paymentMethod: String
    let hospitalityContractId: String

    var formatted: String {
        let string = """

    """
        return string
    }

    init(amountPaid: Int, date: Date, paymentMethod: PaymentMethod, hospitalityContractId: String) {
        self.amountPaid = amountPaid
        self.date = date
        self.paymentMethod = paymentMethod.rawValue
        self.hospitalityContractId = hospitalityContractId
    }

}
