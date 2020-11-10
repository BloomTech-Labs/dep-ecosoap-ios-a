//
//  UpdateCorporateSponsorInput.swift
//  labs-ios-starter
//
//  Created by Cody Morley on 11/8/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class UpdateCorporateSponsorInput: Input {
    private let id: String
    private var hub: Hub?
    private let name: String
    private var type: CompanyType
    private var contactName: String
    private var contactInfo: String
    private var address: String
    private var logo: String?
    private var website: String?
    private var sponsorshipType: SponsorshipType
    private var cashValue: Int
    private var soapBars: Int
    private var soapValue: Int
    
    private var queryBody: String {
        var string = ""
        
        if let hub = hub {
            string += "hub: \"\(hub)\"\n"
        }
        
        if let logo = logo {
            string += "logo: \"\(logo)\"\n"
        }
        
        if let website = website {
            string += "website: \"\(website)\"\n"
        }
        
        return string
    }
    
    
    
    var formatted: String {
        return """
        id: \"\(id)\"
        name: \"\(name)\"
        type: \"\(type.rawValue)\"
        contactName: \"\(contactName)\"
        contactInfo: \"\(contactInfo)\"
        address: \"\(address)\"
        sponsorshipType: \"\(sponsorshipType.rawValue)\"
        cashValue: \"\(cashValue)\"
        soapBars: \"\(soapBars)\"
        soapValue: \"\(soapValue)\"
        \(queryBody)
        """
    }
    
    internal init(id: String,
                  hub: Hub?,
                  name: String,
                  type: CompanyType,
                  contactName: String,
                  contactInfo: String,
                  address: String,
                  logo: String?,
                  website: String?,
                  sponsorshipType:
                    SponsorshipType,
                  cashValue: Int,
                  soapBars: Int,
                  soapValue: Int ) {
        
        self.id = id
        self.hub = hub
        self.name = name
        self.type = type
        self.contactName = contactName
        self.contactInfo = contactInfo
        self.address = address
        self.logo = logo
        self.website = website
        self.sponsorshipType = sponsorshipType
        self.cashValue = cashValue
        self.soapBars = soapBars
        self.soapValue = soapValue
    }
}
