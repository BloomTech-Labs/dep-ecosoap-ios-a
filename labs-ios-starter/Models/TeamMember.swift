//
//  TeamMember.swift
//  labs-ios-starter
//
//  Created by Brian Vilchez on 11/16/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class TeamMember {
    
   let id: String
   let hub: Hub
   let firstName: String
   let middleName: String
   let lastName: String?
   var title: String
   var bio: String
   var email: String
   var phone: String
   var skype: String
   var portrait: String
   let joinDate: Date
    
    
    init?(dictionary: [String: Any]) {
        
        guard let id = dictionary["id"] as? String,
              let firstName = dictionary["firstName"] as? String,
              let middleName = dictionary["middleName"] as? String,
              let lastName = dictionary["lastName"] as? String,
              let title = dictionary["title"] as? String,
              let bio = dictionary["bio"] as? String,
              let email = dictionary["email"] as? String,
              let phone = dictionary["phone"] as? String,
              let skype = dictionary["skype"] as? String,
              let portrait = dictionary["portrait"] as? String,
              let joinDate = dictionary["joinDate"] as? Date,
              let hubContainer = dictionary["hub"] as? [String : Any],
              let hub = Hub(dictionary: hubContainer) else { return nil }
        
        self.hub = hub
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.title = title
        self.bio = bio
        self.email = email
        self.phone = phone
        self.skype = skype
        self.portrait = portrait
        self.joinDate = joinDate
     }
}
