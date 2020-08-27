//
//  ImpactStatsInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class ImpactStatsInput {

    private let soapRecycled, linensRecycled, bottlesRecycled, paperRecycled, peopleServed, womenEmployed: Int?

    var formatted: String {
        var string = ""

        if let soapRecycled = soapRecycled {
            string += "soapRecycled: \(soapRecycled)\n"
        }

        if let linensRecycled = linensRecycled {
            string += "linensRecycled: \(linensRecycled)\n"
        }

        if let bottlesRecycled = bottlesRecycled {
            string += "bottlesRecycled: \(bottlesRecycled)\n"
        }

        if let paperRecycled = paperRecycled {
            string += "paperRecycled: \(paperRecycled)\n"
        }

        if let peopleServed = peopleServed {
            string += "peopleServed: \(peopleServed)\n"
        }

        if let womenEmployed = womenEmployed {
            string += "womenEmployed: \(womenEmployed)\n"
        }

        if string.isEmpty {
            return string
        } else {
            return """
            impact: {
                \(string)
            }
            """
        }
    }

    init(soapRecycled: Int? = nil,
         linensRecycled: Int? = nil,
         bottlesRecycled: Int? = nil,
         paperRecycled: Int? = nil,
         peopleServed: Int? = nil,
         womenEmployed: Int? = nil) {
        self.soapRecycled = soapRecycled
        self.linensRecycled = linensRecycled
        self.bottlesRecycled = bottlesRecycled
        self.paperRecycled = paperRecycled
        self.peopleServed = peopleServed
        self.womenEmployed = womenEmployed
    }

}
