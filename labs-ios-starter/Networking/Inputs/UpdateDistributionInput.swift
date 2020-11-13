//
//  UpdateDistributionInput.swift
//  labs-ios-starter
//
//  Created by Cody Morley on 11/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class UpdateDistributionInput: Input {
    private let id: String
    private let hub: Hub
    private let date: Date
    private let partner: DistributionPartner?
    private var soapDistributed: Int?
    private var bottlesDistributed: Int?
    private var linensDistributed: Int?
    private var photos: [String]?
    private var videos: [String]?
    private var notes: String?
    
    private var dateString: String {
        return date.asLongDateString()
    }
    
    private var queryBody: String {
        var string = ""
        
        if let partner = partner {
            string += "partner: \"\(partner)\"\n"
        }
        
        if let soapDistributed = soapDistributed {
            string += "soapDistributed: \"\(soapDistributed)\"\n"
        }
        
        if let bottlesDistributed = bottlesDistributed {
            string += "bottlesDistributed: \"\(bottlesDistributed)\"\n"
        }
        
        if let linensDistributed = linensDistributed {
            string += "linensDistributed: \"\(linensDistributed)\"\n"
        }
        
        if let photos = photos {
            string += "photos: \"\(photos)\"\n"
        }
        
        if let videos = videos {
            string += "videos: \"\(videos)\"\n"
        }
        
        if let notes = notes {
            string += "notes: \"\(notes)\"\n"
        }
        
        return string
    }
    
    
    var formatted: String {
        return """
        id: \"\(id)\"
        hub: \"\(hub)\"
        date: \"\(dateString)\"
        \(queryBody)
        """
    }
    
    internal init(id: String,
                  hub: Hub,
                  date: Date,
                  partner: DistributionPartner?,
                  soapDistributed: Int?,
                  bottlesDistributed: Int?,
                  linensDistributed: Int?,
                  photos: [String]?,
                  videos: [String]?,
                  notes: String?) {
        
        self.id = id
        self.hub = hub
        self.date = date
        self.partner = partner
        self.soapDistributed = soapDistributed
        self.bottlesDistributed = bottlesDistributed
        self.linensDistributed = linensDistributed
        self.photos = photos
        self.videos = videos
        self.notes = notes
    }
}
