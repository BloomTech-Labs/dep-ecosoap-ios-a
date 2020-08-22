//
//  Enums.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/19/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

enum PropertyType {
    case BED_AND_BREAKFAST
    case GUESTHOUSE
    case HOTEL
    case OTHER
}


enum HospitalityService {
    case BOTTLES
    case LINENS
    case OTHER
    case PAPER
    case SOAP
}

enum CollectionType {
    case COURIER_CONSOLIDATED
    case COURIER_DIRECT
    case GENERATED_LABEL
    case LOCAL
    case OTHER
}

enum Workflow {
    case MANUAL
    case ENHANCED
    case SEMIAUTO
    case AUTO
    case OTHER
}

enum PaymentMethod {
    case ACH
    case CREDIT
    case DEBIT
    case WIRE
    case OTHER
}
