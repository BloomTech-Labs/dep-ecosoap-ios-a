//
//  Payment.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/20/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Payment {
    let id, paymentMethod: String
    let invoiceCode: String?
    let invoice: URL?
    let amountPaid, amountDue: Int
    let date: Date
    let invoicePeriodStartDate, invoicePeriodEndDate, dueDate: Date?
    let contractsById: [String] = []

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let paymentMethod = dictionary["paymentMethod"] as? String,
        let amountPaid = dictionary["amountPaid"] as? Int,
        let amountDue = dictionary["amountDue"] as? Int,
        let dateString = dictionary["date"] as? String else {
            NSLog("Error unwrapping non-optional Payment properties:")
            NSLog("\tID: \(String(describing: dictionary["id"]))")
            NSLog("\tPayment Method: \(String(describing: dictionary["paymentMethod"]))")
            NSLog("\tAmount Paid: \(String(describing: dictionary["amountPaid"]))")
            NSLog("\tAmount Due: \(String(describing: dictionary["amountDue"]))")
            NSLog("\tDate String: \(String(describing: dictionary["date"]))")
            return nil
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        guard let date = formatter.date(from: dateString) else {
            return nil
        }

        self.id = id
        self.paymentMethod = paymentMethod
        self.amountPaid = amountPaid
        self.amountDue = amountDue
        self.date = date

        self.invoiceCode = dictionary["invoiceCode"] as? String
        self.invoice = dictionary["invoice"] as? URL
        self.invoicePeriodStartDate = formatter.date(from: dictionary["invoicePeriodStartDate"] as? String ?? "")
        self.invoicePeriodEndDate = formatter.date(from: dictionary["invoicePeriodEndDate"] as? String ?? "")
        self.dueDate = formatter.date(from: dictionary["dueDate"] as? String ?? "")
    }
}
