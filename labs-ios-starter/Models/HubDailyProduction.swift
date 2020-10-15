//
//  ProductionReport.swift
//  labs-ios-starter
//
//  Created by Harmony Radley on 10/5/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class HubDailyProduction {
    let id: String
    var hub: Hub?
    let date: String
    let barsProduced: Int
    let soapmakersWorked: Int
    let soapmakerHours: Int
    var soapPhotos: [String] = []
    var media: [String] = []
    var productionReportsByHubId: [String] = []

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
            let barsProduced = dictionary["barsProduced"] as? Int,
            let soapmakersWorked = dictionary["soapmakersWorked"] as? Int,
            let soapmakerHours = dictionary["soapmakerHours"] as? Int,
            let dateString = dictionary["date"] as? String,
            let soapPhotos = dictionary["soapPhotos"] as? [String] else {
                NSLog("\tID: \(String(describing: dictionary["id"]))")
                NSLog("\tDate String: \(String(describing: dictionary["date"]))")
                return nil
        }

        self.id = id
        self.date = dateString
        self.barsProduced = barsProduced
        self.soapmakersWorked = soapmakersWorked
        self.soapmakerHours = soapmakerHours
        self.soapPhotos = soapPhotos

        if let hubContainer = dictionary["hub"] as? [String: Any] {
            self.hub = Hub(dictionary: hubContainer)
        } // else statement - NSLOG 

        if let properties = dictionary["properties"] as? [[String: Any]] {
            for data in properties {
                if let id = data["id"] as? String {
                    self.productionReportsByHubId.append(id)
                }
            }
        }
    }
}
