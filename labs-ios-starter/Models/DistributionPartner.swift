//
//  DistributionPartner.swift
//  labs-ios-starter
//
//  Created by Cody Morley on 11/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class DistributionPartner: Hashable {
    let id: String
    let hub: Hub
    let name: String
    let type: CompanyType
    var contactName: String
    var contactInfo: String
    var address: String?
    var logo: String?
    var website: String?
    
    init?(dictionary: [String : Any]) {
        guard let id = dictionary ["id"] as? String,
              let hubContainer = dictionary ["hub"] as? [String : Any],
              let hub = Hub(dictionary: hubContainer),
              let name = dictionary ["name"] as? String,
              let typeString = dictionary ["type"] as? String,
              let type = CompanyType(rawValue: typeString),
              let contactName = dictionary ["contactName"] as? String,
              let contactInfo = dictionary ["contactInfo"] as? String else {
            NSLog("Error unwrapping a non-optional property when decoding CorporateSponsor object. Properties:")
            NSLog("id: \(String(describing: dictionary["id"]))")
            NSLog("hub: \(String(describing: dictionary["hub"]))")
            NSLog("name: \(String(describing: dictionary["name"]))")
            NSLog("type: \(String(describing: dictionary["type"]))")
            NSLog("conatactName: \(String(describing: dictionary["contactName"]))")
            NSLog("contactInfo: \(String(describing: dictionary["contactInfo"]))")
            return nil
        }
        
        if let address = dictionary["address"] as? String {
            self.address = address
        }
        
        if let logo = dictionary["logo"] as? String {
            self.logo = logo
        }
        
        if let website = dictionary["website"] as? String {
            self.website = website
        }
        
        self.id = id
        self.hub = hub
        self.name = name
        self.type = type
        self.contactInfo = contactInfo
        self.contactName = contactName
    }
    
    static func == (lhs: DistributionPartner, rhs: DistributionPartner) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
