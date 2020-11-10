//
//  CorporateSponsor.swift
//  labs-ios-starter
//
//  Created by Cody Morley on 11/8/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class CorporateSponsor {
    let id: String
    var hub: Hub?
    let name: String
    var type: CompanyType
    var contactName: String
    var contactInfo: String
    var address: String
    var logo: String?
    var website: String?
    var sponsorshipType: SponsorshipType
    var cashValue: Int
    var soapBars: Int
    var soapValue: Int
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
              let name = dictionary["name"] as? String,
              let companyType = dictionary["companyType"] as? String,
              let contactName = dictionary["contactName"] as? String,
              let contactInfo = dictionary["contactInfo"] as? String,
              let address = dictionary["address"] as? String,
              let sponsorshipType = dictionary["sponsorshipType"] as? String,
              let cashValue = dictionary["cashValue"] as? Int,
              let soapBars = dictionary["soapBars"] as? Int,
              let soapValue = dictionary["soapValue"] as? Int else {
            NSLog("Error unwrapping a non-optional property when decoding CorporateSponsor object. Properties:")
            NSLog("id: \(String(describing: dictionary["id"]))")
            NSLog("name: \(String(describing: dictionary["name"]))")
            NSLog("type: \(String(describing: dictionary["type"]))")
            NSLog("conatactName: \(String(describing: dictionary["contactName"]))")
            NSLog("contactInfo: \(String(describing: dictionary["contactInfo"]))")
            NSLog("address: \(String(describing: dictionary["address"]))")
            NSLog("sponsorshipType: \(String(describing: dictionary["sponsorshipType"]))")
            NSLog("cashValue: \(String(describing: dictionary["cashValue"]))")
            NSLog("soapBars: \(String(describing: dictionary["soapBars"]))")
            NSLog("soapValue: \(String(describing: dictionary["soapValue"]))")
            return nil
        }
        
        if let hubContainer = dictionary["hub"] as? [String: Any] {
            self.hub = Hub(dictionary: hubContainer)
        }
        
        if let logo = dictionary["logo"] as? String {
            self.logo = logo
        }
        
        if let website = dictionary["website"] as? String {
            self.website = website
        }
        
        if let companyType = CompanyType(rawValue: companyType) {
            self.type = companyType
        }
        
        if let sponsorship = SponsorshipType(rawValue: sponsorshipType) {
            self.sponsorshipType = sponsorship
        }
        
        self.id = id
        self.name = name
        self.contactName = contactName
        self.contactInfo = contactInfo
        self.address = address
        self.cashValue = cashValue
        self.soapBars = soapBars
        self.soapValue = soapValue
    }
}
