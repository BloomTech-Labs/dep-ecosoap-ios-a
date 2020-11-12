//
//  ControllerEnums.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

enum ResponseModel: String {
    case user
    case users
    case property
    case properties
    case impactStats
    case hub
    case pickups
    case pickup
    case payment
    case payments
    case productionReport
    case productionReports
    case corporateSponsors
    case distributionPartners
    case distributions
}

enum MutationName: String {
    case schedulePickup
    case updatePickup
    case cancelPickup
    case createPayment
    case updateUserProfile
    case updateProperty
    case createProductionReport
    case updateProductionReport
    case deleteProductionReport
    case updateCorporateSponsor
    case updateDistribution
}

enum QueryName: String {
    case userById
    case allUsers = "users"
    case propertiesByUserId
    case propertyById
    case impactStatsByPropertyId
    case impactStatsByHubId
    case hubByPropertyId
    case pickupsByPropertyId
    case pickupsByHubId
    case nextPaymentByPropertyId
    case paymentsByPropertyId
    case monsterFetch
    case productionReportsByHubId
    case corporateSponsors
    case distributionPartners
    case distributions
}


