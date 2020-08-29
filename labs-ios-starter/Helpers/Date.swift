//
//  Date.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/28/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

extension Date {

    init?(longDate string: String) {
        guard let date = DateFormatter.longFormatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval: 0, since: date)
    }

    init?(shortDate string: String) {
        guard let date = DateFormatter.shortFormatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval: 0, since: date)
    }
}
