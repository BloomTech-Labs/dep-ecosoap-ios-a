//
//  Enums.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/19/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

enum PropertyType: String {
    case BED_AND_BREAKFAST
    case GUESTHOUSE
    case HOTEL
    case OTHER
}


enum HospitalityService: String {
    case BOTTLES
    case LINENS
    case OTHER
    case PAPER
    case SOAP
}

enum CollectionType: String {
    case COURIER_CONSOLIDATED
    case COURIER_DIRECT
    case GENERATED_LABEL
    case LOCAL
    case OTHER
}

enum Workflow: String {
    case MANUAL
    case ENHANCED
    case SEMIAUTO
    case AUTO
    case OTHER
}

enum PaymentMethod: String {
    case ACH
    case CREDIT
    case DEBIT
    case WIRE
    case OTHER
}

enum Status: String {
    case SUBMITTED
    case OUT_FOR_PICKUP
    case COMPLETE
    case CANCELLED
}

enum Role: String {
    case user =  "HUB_USER"
    case partner = "HOTEL"
    case hubAdmin = "HUB_ADMIN"
    case admin = "ADMIN"
}

enum CompanyType: String {
    case NGO_INTERNATIONAL
    case NGO_LOCAL
    case CORPORATION_INTERNATIONAL
    case CORPORATION_LOCAL
    case FOR_PROFIT_OTHER
    case SCHOOL
    case ORPHANAGE
    case HEALTHCARE_FACILITY
    case LOCAL_MARKET
    case OTHER
}

enum SponsorshipType: String {
    case CASH
    case SOAP
}
