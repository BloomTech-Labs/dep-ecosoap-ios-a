//
//  User.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class User {
    
    let id: String
    var firstName, lastName, email: String
    var middleName, title, company, phone, skype, address: String?
    
    init(id: String, firstName: String, lastName: String, email: String, middleName: String? = nil, title: String? = nil, company: String? = nil, phone: String? = nil, skype: String? = nil, address: String? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.middleName = middleName
        self.title = title
        self.company = company
        self.phone = phone
        self.skype = skype
        self.address = address
    }

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let firstName = dictionary["firstName"] as? String,
        let lastName = dictionary["lastName"] as? String,
        let email = dictionary["email"] as? String else {
            NSLog("Error unwrapping optional User properties:")
            NSLog("\tID: \(String(describing: dictionary["id"])) ")
            NSLog("\tFirst Name: \(String(describing: dictionary["firstName"])) ")
            NSLog("\tLast Name: \(String(describing: dictionary["lastName"])) ")
            NSLog("\tEmail: \(String(describing: dictionary["email"])) ")
            return nil
        }

        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email

        self.middleName = dictionary["middleName"] as? String
        self.title = dictionary["title"] as? String
        self.company = dictionary["company"] as? String
        self.phone = dictionary["phone"] as? String
        self.skype = dictionary["skype"] as? String
        self.address = dictionary["address"] as? String
    }
    
}
