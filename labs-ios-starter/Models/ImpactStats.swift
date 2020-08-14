//
//  ImpactStats.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class ImpactStats {

    let soapRecycled, linensRecycled, bottlesRecycled, paperRecycled, peopleServed, womenEmployed: Int?
    
    init(soapRecycled: Int?, linensRecycled: Int?, bottlesRecycled: Int?, paperRecycled: Int?, peopleServed: Int?, womenEmployed: Int?) {
        self.soapRecycled = soapRecycled
        self.linensRecycled = linensRecycled
        self.bottlesRecycled = bottlesRecycled
        self.paperRecycled = paperRecycled
        self.peopleServed = peopleServed
        self.womenEmployed = womenEmployed
    }

    init?(dictionary: [String: Any]) {
        self.soapRecycled = dictionary["soapRecycled"] as? Int
        self.linensRecycled = dictionary["linensRecycled"] as? Int
        self.bottlesRecycled = dictionary["bottlesRecycled"] as? Int
        self.paperRecycled = dictionary["paperRecycled"] as? Int
        self.peopleServed = dictionary["peopleServed"] as? Int
        self.womenEmployed = dictionary["womenEmployed"] as? Int
    }

}
