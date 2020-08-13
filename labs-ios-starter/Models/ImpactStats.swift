//
//  ImpactStats.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class ImpactStats {
    
    let id: Int
    let soapRecycled, linensRecycled, bottlesRecycled, paperRecycled, peopleServed, womenEmployed: Int?
    
    init(id: Int, soapRecycled: Int?, linensRecycled: Int?, bottlesRecycled: Int?, paperRecycled: Int?, peopleServed: Int?, womenEmployed: Int?) {
        self.id = id
        self.soapRecycled = soapRecycled
        self.linensRecycled = linensRecycled
        self.bottlesRecycled = bottlesRecycled
        self.paperRecycled = paperRecycled
        self.peopleServed = peopleServed
        self.womenEmployed = womenEmployed
    }
    
}
