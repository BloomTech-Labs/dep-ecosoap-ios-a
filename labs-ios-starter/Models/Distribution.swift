//
//  Distribution.swift
//  labs-ios-starter
//
//  Created by Cody Morley on 11/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//
//TODO: FormatDate

import Foundation


class Distribution {
    let id: String
    let hub: Hub
    let date: Date
    let partner: DistributionPartner?
    var soapDistributed: Int?
    var bottlesDistributed: Int?
    var linensDistributed: Int?
    var photos: [String]?
    var videos: [String]?
    var notes: String?
    
    init?(dictionary: [String : Any]) {
        guard let id = dictionary["id"] as? String,
              let hubContainer = dictionary["hub"] as? [String : Any],
              let hub = Hub(dictionary: hubContainer),
              let dateString = dictionary["date"] as? String,
              let date = Date(shortDate: dateString) else {
            NSLog("Error unwrapping non-optional Pickup properties:")
            NSLog("id: \(String(describing: dictionary["id"]))")
            NSLog("hub: \(String(describing: dictionary["hub"]))")
            NSLog("date: \(String(describing: dictionary["date"]))")
            NSLog("distribution partner: \(String(describing: dictionary["partner"]))")
            return nil
        }
        
        if let partnerContainer = dictionary["partner"] as? [String : Any] {
            self.partner = DistributionPartner(dictionary: partnerContainer)
        }
        
        if let soapDistributed = dictionary["soapDistributed"] as? Int {
            self.soapDistributed = soapDistributed
        }
        
        if let bottlesDistributed = dictionary["bottlesDistrubuted"] as? Int {
            self.bottlesDistributed = bottlesDistributed
        }
        
        if let linensDistributed = dictionary["linensDistributed"] as? Int {
            self.linensDistributed = linensDistributed
        }
        
        if let photos = dictionary["photos"] as? [String] {
            self.photos = photos
        }
        
        if let videos = dictionary["videos"] as? [String] {
            self.videos = videos
        }
        
        if let notes = dictionary["notes"] as? String {
            self.notes = notes
        }
        
        self.id = id
        self.hub = hub
        self.date = date
    }
}

