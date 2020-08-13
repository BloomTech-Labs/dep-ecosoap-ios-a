//
//  User.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class User {
    
    let id: Int
    var firstName, lastName, email: String
    var middleName, title, company, phone, skype, address: String?
    
    init(id: Int, firstName: String, lastName: String, email: String, middleName: String? = nil, title: String? = nil, company: String? = nil, phone: String? = nil, skype: String? = nil, address: String? = nil) {
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
    
}
