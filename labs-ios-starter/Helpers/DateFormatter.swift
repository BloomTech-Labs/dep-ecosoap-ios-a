//
//  DateFormatter.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/28/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let shortFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    static let longFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxxxx"
        return formatter
    }()
}
