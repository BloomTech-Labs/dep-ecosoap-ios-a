//
//  UpdatePropertyInput.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class UpdatePropertyInput: Input {

    private let id: String
    private let name, propertyType, collectionType, phone, shippingNote, notes, hubId, contractId: String?
    private let services: [HospitalityService]?
    private let rooms: Int?
    private let logo: URL?
    private let billingAddress, shippingAddress: AddressInput?
    private let coordinates: CoordinatesInput?
    private let impact: ImpactStatsInput?
    private let userIds, pickupIds: [String]?

    private var servicesQuery: String {
        guard let services = services,
            !services.isEmpty else {
            return ""
        }
        var arr: [String] = []

        for service in services {
            arr.append(service.rawValue)
        }

        return "services: [\(arr.joined(separator: ", "))]\n"
    }

    private var userIdsQuery: String {
        guard let userIds = userIds,
            !userIds.isEmpty else {
            return ""
        }

        var string = "userIds: ["
        for id in userIds {
            string += "\"\(id)\", "
        }
        string += "]\n"
        return string
    }

    private var pickupIdsQuery: String {
        guard let pickupIds = pickupIds,
            !pickupIds.isEmpty else {
            return ""
        }

        var string = "pickupIds: ["
        for id in pickupIds {
            string += "\"\(id)\", "
        }
        string += "]\n"
        return string
    }

    private var queryBody: String {
        var string = ""

        if let name = name {
            string += "name: \"\(name)\"\n"
        }

        if let propertyType = propertyType {
            string += "propertyType: \(propertyType)\n"
        }

        if let collectionType = collectionType {
            string += "collectionType: \(collectionType)\n"
        }

        if let phone = phone {
            string += "phone: \"\(phone)\"\n"
        }

        if let shippingNote = shippingNote {
            string += "shippingNote: \"\(shippingNote)\"\n"
        }

        if let notes = notes {
            string += "notes: \"\(notes)\"\n"
        }

        if let hubId = hubId {
            string += "hubId: \"\(hubId)\"\n"
        }

        if let contractId = contractId {
            string += "contractId: \"\(contractId)\"\n"
        }

        string += servicesQuery

        if let rooms = rooms {
            string += "rooms: \(rooms)\n"
        }

        if let logo = logo {
            string += "logo: \"\(logo.absoluteString)\"\n"
        }

        if let billingAddress = billingAddress {
            string += "billing\(billingAddress.formatted.firstLetterCapitalizing())\n"
        }

        if let shippingAddress = shippingAddress {
            string += "shipping\(shippingAddress.formatted.firstLetterCapitalizing())\n"
        }

        if let coordinates = coordinates {
            string += "\(coordinates.formatted)\n"
        }

        if let impact = impact {
            string += impact.formatted
        }

        string += userIdsQuery
        string += pickupIdsQuery

        return string
    }

    var formatted: String {
        return """
        id: \"\(id)\"
        \(queryBody)
        """
    }

    internal init(id: String,
                  name: String? = nil,
                  propertyType: PropertyType? = nil,
                  services: [HospitalityService]? = nil,
                  collectionType: CollectionType? = nil,
                  phone: String? = nil,
                  shippingNote: String? = nil,
                  notes: String? = nil,
                  hubId: String? = nil,
                  contractId: String? = nil,
                  rooms: Int? = nil,
                  logo: URL? = nil,
                  billingAddress: AddressInput? = nil,
                  shippingAddress: AddressInput? = nil,
                  coordinates: CoordinatesInput? = nil,
                  impact: ImpactStatsInput? = nil,
                  userIds: [String]? = nil,
                  pickupIds: [String]? = nil) {

        self.id = id

        self.name = name
        self.propertyType = propertyType?.rawValue
        self.services = services
        self.collectionType = collectionType?.rawValue
        self.phone = phone
        self.shippingNote = shippingNote
        self.notes = notes
        self.hubId = hubId
        self.contractId = contractId

        self.rooms = rooms

        self.logo = logo

        self.billingAddress = billingAddress
        self.shippingAddress = shippingAddress

        self.coordinates = coordinates

        self.impact = impact

        self.userIds = userIds
        self.pickupIds = pickupIds
    }
}
