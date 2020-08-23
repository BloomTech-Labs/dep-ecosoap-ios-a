//
//  NetworkController.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class BackendController {
    private let apiURL: URL = URL(string: "http://35.208.9.187:9096/ios-api-3")!

//    var loggedInUser: User

    var users: [String: User] = [:]
    var properties: [String: Property] = [:]
    var pickups: [String: Pickup] = [:]
    var hubs: [String: Hub] = [:]
    var payments: [String: Payment] = [:]
    var pickupCartons: [String: PickupCarton] = [:]
    var hospitalityContracts: [String: HospitalityContract] = [:]

    private var parsers: [String: (Any?)->()] = [:]

    private var propertyParser: (Any?) -> Void = {_ in }
    private var propertiesParser: (Any?) -> Void = {_ in }
    private var userParser: (Any?) -> Void = {_ in }
    private var pickupParser: (Any?) -> Void = {_ in }
    private var pickupsParser: (Any?) -> Void = {_ in }
    private var hubParser: (Any?) -> Void = {_ in }
    private var paymentParser: (Any?) -> Void = {_ in }
    private var paymentsParser: (Any?) -> Void = {_ in }


    init() {
//        self.loggedInUser = user

        self.propertyParser = {
            guard let propertyContainer = $0 as? [String: Any] else {
                NSLog("Couldn't PROPERTY cast data as dictionary for initialization")
                return
            }

            guard let property = Property(dictionary: propertyContainer) else {
                return
            }
            self.properties[property.id] = property
        }

        self.propertiesParser = {
            guard let propertiesContainer = $0 as? [[String: Any]] else {
                NSLog("Couldn't PROPERTIES cast data as dictionary for initialization")
                return
            }

            for prop in propertiesContainer {
                self.propertyParser(prop)
            }
        }

        self.userParser = {
            guard let userContainer = $0 as? [String: Any] else {
                NSLog("Couldn't USER cast data as dictionary for initialization")
                return
            }

            guard let user = User(dictionary: userContainer) else {
                return
            }
            self.users[user.id] = user
        }

        self.pickupParser = {
            guard let pickupContainer = $0 as? [String: Any] else {
                NSLog("Couldn't PICKUP cast data as dictionary for initialization")
                return
            }

            guard let pickup = Pickup(dictionary: pickupContainer) else {
                return
            }
            self.pickups[pickup.id] = pickup
        }

        self.pickupsParser = {
            guard let pickupsContainer = $0 as? [[String: Any]] else {
                NSLog("Couldn't cast data as dictionary for PICKUPS container.")
                return
            }

            for pickup in pickupsContainer {
                self.pickupParser(pickup)
            }
        }

        self.hubParser = {
            guard let hubContainer = $0 as? [String: Any] else {
                NSLog("Couldn't cast data as dictionary for HUB initialization.")
                return
            }

            guard let hub = Hub(dictionary: hubContainer) else {
                NSLog("Failed to initialize HUB in parser.")
                NSLog("Dictionary:")
                NSLog("\t\(hubContainer)")
                return
            }
            self.hubs[hub.id] = hub
        }

        self.paymentParser = {
            guard let paymentContainer = $0 as? [String: Any] else {
                NSLog("Couldn't cast data as dictionary for PAYMENT initialization.")
                return
            }

            guard let payment = Payment(dictionary: paymentContainer) else {
                NSLog("Failed to initialize HUB in parser.")
                NSLog("Dictionary:")
                NSLog("\t\(paymentContainer)")
                return
            }
            self.payments[payment.id] = payment
        }

        self.paymentsParser = {
            guard let paymentsContainer = $0 as? [[String: Any]] else {
                NSLog("Couldn't cast data as dictionary for PAYMENTS container.")
                return
            }

            for payment in paymentsContainer {
                self.paymentParser(payment)
            }
        }

        self.parsers = ["properties":propertyParser,
        "property":propertiesParser,
        "user":userParser,
        "pickup":pickupParser,
        "pickups":pickupsParser,
        "hub":hubParser,
        "payment":paymentParser,
        "payments":paymentsParser]

    }

    func propertiesByUserId(id: String, completion: @escaping (Error?) -> Void) {
        queryAPI(query: .propertiesByUserId, id: id) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func propertyById(id: String, completion: @escaping (Error?) -> Void) {
        queryAPI(query: .propertyById, id: id) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func userById(id: String, completion: @escaping (Error?) -> Void) {
        queryAPI(query: .userById, id: id) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func impactStatsByPropertyId(id: String, completion: @escaping (Error?) -> Void) {
        queryAPI(query: .impactStatsByPropertyId, id: id) { (data, error) in
            if let error = error {
                completion(error)
                return
            }

            guard let property = self.properties[id] else {
                NSLog("This property is not currently stored into memory. Can't store impact stats.")
                completion(NSError(domain: "Error locating property.", code: 0, userInfo: nil))
                return
            }

            guard let container = data as? [String: Any] else {
                NSLog("Couldn't unwrap data as dictionary for initializing an ImpactStats object.")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }

            guard let stats = ImpactStats(dictionary: container) else {
                completion(NSError(domain: "Error initializing ImpactStats", code: 0, userInfo: nil))
                return
            }

            property.impact = stats
            completion(nil)

        }
    }

    func initialFetch(userId: String, completion: @escaping (Error?) -> Void) {
        queryAPI(query: .monsterFetch, id: userId) { (data, error) in
            if let error = error {
                completion(error)
                return
            }

            // Cast the data as a dictionary.
            guard let container = data as? [String: Any] else {
                NSLog("Couldn't unwrap USER data as dictionary in initial fetch.")
                NSLog("\(String(describing: data))")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }

            // Start by initializing the user.
            guard let user = User(dictionary: container) else {
                NSLog("Failed to initialize new user in initial fetch.")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }
            self.users[user.id] = user

            // Unwrap array of Properties if present
            guard let properties = container["properties"] as? [[String: Any]] else {
                NSLog("Failed to unwrap properties array from user payload.")
                NSLog("\tProperties: \(String(describing: container["properties"]))")
                completion(NSError(domain: "Error unwrapping data.", code: 0, userInfo: nil))
                return
            }

            // Initialize every property and add it to the dictionary
            for propertyContainer in properties {
                // Initializer handles error logs if failed to initialize.
                if let property = Property(dictionary: propertyContainer) {
                    self.properties[property.id] = property

                    // For every properly initialized property.
                    // If they contain a valid Hub, add it to the dictionary.
                    if let hub = property.hub {
                        self.hubs[hub.id] = hub
                    }

                    // Handle pickups.
                    if let pickups = propertyContainer["pickups"] as? [[String: Any]] {
                        for pickupContainer in pickups {
                            // Initializer handles error logs if failed to initialize.
                            if let pickup = Pickup(dictionary: pickupContainer) {
                                self.pickups[pickup.id] = pickup

                                // Handle Cartons
                                if let cartons = pickupContainer["cartons"] as? [[String: Any]] {
                                    for cartonContainer in cartons {
                                        // Initializer handles error logs if failed to initialize.
                                        if let carton = PickupCarton(dictionary: cartonContainer) {
                                            self.pickupCartons[carton.id] = carton
                                        }
                                    }
                                } else {
                                    NSLog("Couldn't cast array of dictionary for pickup cartons data for pickup with ID: \(pickup.id)")
                                }
                            }
                        }
                    } else {
                        NSLog("Couldn't cast array of dictionary for pickup data for property with ID: \(property.id)")
                    }

                    // Handle contract.
                    if let contractContainer = propertyContainer["contract"] as? [String: Any] {
                        // Initializer handles error logs if failed to initialize.
                        if let contract = HospitalityContract(dictionary: contractContainer) {
                            self.hospitalityContracts[contract.id] = contract

                            // Handle payments.
                            if let payments = contractContainer["payments"] as? [[String: Any]] {
                                for paymentContainer in payments {
                                    // Initializer handles error logs if failed to initialize.
                                    if let payment = Payment(dictionary: paymentContainer) {
                                        self.payments[payment.id] = payment
                                    }
                                }
                            } else {
                                NSLog("Couldn't cast payments dictionary array for contract with ID: \(contract.id)")
                            }
                        }
                    } else {
                        NSLog("Couldn't cast contract dictionary for property with ID: \(property.id)")
                    }
                }
            }

            completion(nil)
        }
    }

    private func queryAPI(query: Queries.Key, id: String, completion: @escaping (Any?, Error?) -> Void) {
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let wtf = Queries.shared.collection[query.rawValue]!(id)

        request.httpBody = try! JSONSerialization.data(withJSONObject: ["query": wtf], options: [])

        print("Request body")
        print(String(data: request.httpBody!, encoding: .utf8)!)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, nil)
                return
            }

            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let dataContainer = dict?["data"]  as? [String: Any]
                var queryContainer:[String: Any]?

                let payloadString = Queries.shared.payloads[query.rawValue]!

                if query == .monsterFetch {
                    queryContainer = dataContainer?["userById"] as? [String: Any]
                    completion(queryContainer?[payloadString], nil)
                    return
                } else {
                    queryContainer = dataContainer?[query.rawValue] as? [String: Any]
                }


                guard let parser = self.parsers[payloadString] else {
                    print("The payload \(payloadString) doesn't possess a parser.")
                    completion(queryContainer?[payloadString], nil)
                    return
                }
                parser(queryContainer?[payloadString])
                completion(nil, nil)

            } catch let error {
                completion(nil, error)
            }
        }.resume()
    }
}
