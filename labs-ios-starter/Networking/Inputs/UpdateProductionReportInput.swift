//
//  UpdateProductionReportInput.swift
//  labs-ios-starter
//
//  Created by Harmony Radley on 10/7/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class UpdateProductionReportInput: Input {

    private let id: String
    private var hub: Hub?
    private let date: Date
    private let soapmakersWorked: Int?
    private let soapmakerHours: Int?
    private let soapPhotos: [String] = []
    private let media: [String] = []


    private var queryBody: String {
        var string = ""

        if let hub = hub {
            string += "hub: \"\(hub)\"\n"
        }

        if let soapmakersWorked = soapmakersWorked {
            string += "soapmakersWorked: \"\(soapmakersWorked)\"\n"
        }

        if let soapmakerHours = soapmakerHours {
            string += "soapmakerHours: \"\(soapmakerHours)\"\n"
        }

        return string
    }

    var formatted: String {
        return """
        id: \"\(id)\"
        date: \"(date)\"
        soapPhotos: \"(soapPhotos)\"
        media: \"\(media)\"
        \(queryBody)
        """
    }

    internal init(id: String,
                  hub: Hub?,
                  date: Date,
                  soapmakersWorked: Int?,
                  soapmakerHours: Int?,
                  soapPhotos: [String]) {
        self.id = id
        self.hub = hub
        self.date = date
        self.soapmakersWorked = soapmakersWorked
        self.soapmakerHours = soapmakerHours
        
    }
}
