//
//  RegisterInput.swift
//  labs-ios-starter
//
//  Created by Mark Poggi on 10/5/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class RegisterInput: Input {

    //TODO: Double check whether order matters 

    private let email, password, firstName, lastName: String
    private let middleName, title, company, phone, skype: String?

    private var queryBody: String {
        var string = ""

        if let middleName = middleName {
            string += "middleName: \"\(middleName)\"\n"
        }
        if let title = title {
            string += "title: \"\(title)\"\n"
        }
        if let company = company {
            string += "company: \"\(company)\"\n"
        }

        if let phone = phone {
            string += "phone: \"\(phone)\"\n"
        }
        if let skype = skype {
            string += "skype: \"\(skype)\"\n"
        }
        return string
    }

    var formatted: String {
        return """
        email: \"\(email)\"
        password: \"\(password)\"
        firstName: \"\(firstName)\"
        lastName: \"\(lastName)\"
        \(queryBody)
        """
    }
    
    internal init(firstName: String,
                  middleName: String? = nil,
                  lastName: String,
                  password: String,
                  title: String? = nil,
                  company: String? = nil,
                  email: String,
                  phone: String? = nil,
                  skype: String? = nil)
    {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.password = password
        self.title = title
        self.company = company
        self.email = email
        self.phone = phone
        self.skype = skype

    }

}
