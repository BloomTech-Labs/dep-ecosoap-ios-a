//
//  HospitalityContract.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/20/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class HospitalityContract {
    let id, paymentFrequency: String
    let startDate: Date = Date ()
    let endDate: Date = Date ()
    let paymentStartDate: Date = Date ()
    let paymentEndDate: Date = Date ()
    let price: Int?
    let discount: Float?
    let billingMethod: String?
    let automatedBilling: Bool
    let paymentsById: [String]
    let amountPaid: Int?

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let paymentFrequency = dictionary["paymentFrequency"] as? String,
        /*let startDateString = dictionary["startDate"] as? String,
        let endDateString = dictionary["endDate"] as? String,
        let paymentStartDateString = dictionary["paymentStartDate"] as? String,
        let paymentEndDateString = dictionary["paymentEndDate"] as? String,*/
        let automatedBilling = dictionary["automatedBilling"] as? Bool else {
            NSLog("Error unwrapping non-optional HospitalityContract properties:")
            NSLog("\tId: \(String(describing: dictionary["id"]))")
            NSLog("\tPayment Frequency: \(String(describing: dictionary["paymentFrequency"]))")
            NSLog("\tStart Date String: \(String(describing: dictionary["startDate"]))")
            NSLog("\tEnd Date String: \(String(describing: dictionary["endDate"]))")
            NSLog("\tPayment Start Date String: \(String(describing: dictionary["paymentStartDate"]))")
            NSLog("\tPayment End Date String: \(String(describing: dictionary["paymentEndDate"]))")
            NSLog("\tAutomated Billing: \(String(describing: dictionary["automatedBilling"]))")
            return nil
        }

//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-mm-dd"
//        guard let startDate = formatter.date(from: startDateString),
//        let endDate = formatter.date(from: endDateString),
//        let paymentStartDate = formatter.date(from: paymentStartDateString),
//        let paymentEndDate = formatter.date(from: paymentEndDateString) else {
//            return nil
//        }


        self.id = id
        self.paymentFrequency = paymentFrequency
//        self.startDate = startDate
//        self.endDate = endDate
//        self.paymentStartDate = paymentStartDate
//        self.paymentEndDate = paymentEndDate
        self.automatedBilling = automatedBilling

        self.price = dictionary["price"] as? Int
        self.discount = dictionary["discount"] as? Float
        self.billingMethod = dictionary["billingMethod"] as? String
        self.amountPaid = dictionary["amountPaid"] as? Int

        var holder: [String] = []
        if let payments = dictionary["payments"] as? [[String: Any]] {
            for payment in payments {
                if let id = payment["id"] as? String {
                    holder.append(id)
                }
            }
        }
        self.paymentsById = holder


    }
    
}
