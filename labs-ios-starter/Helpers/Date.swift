//
//  Date.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/28/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

extension Date {

    func asLongDateString() -> String {
        return DateFormatter.longFormatter.string(from: self)
    }

    func asShortDateString() -> String {
        return DateFormatter.shortFormatter.string(from: self)
    }

    init?(longDate string: String) {
        if let date = DateFormatter.longFormatter.date(from: string) {
            self = date
        } else {
            NSLog("Couldn't initialize date from this String. Using placeholder.")
            self = Date()
        }
    }

    init?(shortDate string: String) {
        if let date = DateFormatter.shortFormatter.date(from: string) {
            self = date
        } else {
            NSLog("Couldn't initialize date from this String. Using placeholder.")
            self = Date()
        }
    }
}
