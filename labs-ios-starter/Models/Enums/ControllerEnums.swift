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
    case property
    case properties
    case impactStats
    case hub
    case pickups
    case pickup
    case payment
    case payments
}

enum Mutations: String {
    case schedulePickup
}
