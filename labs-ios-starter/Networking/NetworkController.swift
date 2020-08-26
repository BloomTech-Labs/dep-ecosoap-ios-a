//
//  NetworkController.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class BackendController {

    enum Errors: Error {
        case RequestInitFail
    }

    private let apiURL: URL = URL(string: "http://35.208.9.187:9096/ios-api-3")!

//    var loggedInUser: User

    static let shared: BackendController = BackendController()

    private init() {
    }

    var users: [String: User] = [:]
    var properties: [String: Property] = [:]
    var pickups: [String: Pickup] = [:]
    var hubs: [String: Hub] = [:]
    var payments: [String: Payment] = [:]
    var pickupCartons: [String: PickupCarton] = [:]
    var hospitalityContracts: [String: HospitalityContract] = [:]

    private var parsers: [ResponseModel: (Any?)->()] = [.property: BackendController.propertyParser,
                                                        .properties: BackendController.propertiesParser,
                                                        .user: BackendController.userParser,
                                                        .pickup:  BackendController.pickupParser,
                                                        .pickups: BackendController.pickupsParser,
                                                        .hub: BackendController.hubParser,
                                                        .payment: BackendController.paymentParser,
                                                        .payments: BackendController.paymentsParser
                                                        ]

    private static func propertyParser(data: Any?) {
        guard let propertyContainer = data as? [String: Any] else {
            NSLog("Couldn't PROPERTY cast data as dictionary for initialization")
            return
        }

        guard let property = Property(dictionary: propertyContainer) else {
            return
        }
        shared.properties[property.id] = property
    }

    private static func propertiesParser(data: Any?) {
        guard let propertiesContainer = data as? [[String: Any]] else {
            NSLog("Couldn't PROPERTIES cast data as dictionary for initialization")
            return
        }

        for prop in propertiesContainer {
            propertyParser(data:prop)
        }
    }

    private static func userParser(data: Any?) {
        guard let userContainer = data as? [String: Any] else {
            NSLog("Couldn't USER cast data as dictionary for initialization")
            return
        }

        guard let user = User(dictionary: userContainer) else {
            return
        }
        shared.users[user.id] = user
    }

    private static func pickupParser(data: Any?) {
        guard let pickupContainer = data as? [String: Any] else {
            NSLog("Couldn't PICKUP cast data as dictionary for initialization")
            return
        }

        guard let pickup = Pickup(dictionary: pickupContainer) else {
            return
        }

        if let cartonContainer = pickupContainer["cartons"] as? [[String: Any]] {
            cartonParser(data: cartonContainer)
        }
        shared.pickups[pickup.id] = pickup
    }

    private static func pickupsParser(data: Any?) {
        guard let pickupsContainer = data as? [[String: Any]] else {
            NSLog("Couldn't cast data as dictionary for PICKUPS container.")
            return
        }

        for pickup in pickupsContainer {
            pickupParser(data: pickup)
        }
    }

    private static func hubParser(data: Any?) {
        guard let hubContainer = data as? [String: Any] else {
            NSLog("Couldn't cast data as dictionary for HUB initialization.")
            print(data)
            return
        }

        guard let hub = Hub(dictionary: hubContainer) else {
            NSLog("Failed to initialize HUB in parser.")
            NSLog("Dictionary:")
            NSLog("\t\(hubContainer)")
            return
        }
        shared.hubs[hub.id] = hub
    }

    private static func paymentParser(data: Any?) {
        guard let paymentContainer = data as? [String: Any] else {
            NSLog("Couldn't cast data as dictionary for PAYMENT initialization.")
            return
        }

        guard let payment = Payment(dictionary: paymentContainer) else {
            NSLog("Failed to initialize HUB in parser.")
            NSLog("Dictionary:")
            NSLog("\t\(paymentContainer)")
            return
        }
        shared.payments[payment.id] = payment
    }

    private static func paymentsParser(data: Any?) {
        guard let paymentsContainer = data as? [[String: Any]] else {
            NSLog("Couldn't cast data as dictionary for PAYMENTS container.")
            return
        }

        for payment in paymentsContainer {
            paymentParser(data: payment)
        }
    }

    private static func cartonParser(data: Any?) {
        guard let cartonsContainer = data as? [[String: Any]] else {
            return
        }

        for cartonDict in cartonsContainer {
            if let carton = PickupCarton(dictionary: cartonDict) {
                shared.pickupCartons[carton.id] = carton
            }
        }

    }

    func propertiesByUserId(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .propertiesByUserId, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func propertyById(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .propertyById, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func userById(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .userById, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func hubByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .hubByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func pickupsByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .pickupsByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func nextPaymentByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .nextPaymentByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func paymentsByPropertyId(propertyId: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .paymentsByPropertyId, id: propertyId) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }

    func impactStatsByPropertyId(id: String, completion: @escaping (Error?) -> Void) {
        guard let request = Queries(name: .impactStatsByPropertyId, id: id) else {
            completion(Errors.RequestInitFail)
            return
        }

        requestAPI(with: request) { (data, error) in
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
        guard let request = Queries(name: .monsterFetch, id: userId) else {
            completion(Errors.RequestInitFail)
            return
        }

        requestAPI(with: request) { (data, error) in
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

    func schedulePickup(input: PickupInput, completion: @escaping (Error?) -> Void) {
        guard let request = Mutator(name: .schedulePickup, input: input) else {
            completion(Errors.RequestInitFail)
            return
        }
        requestAPI(with: request) { (_, error) in
            if let error = error {
                completion(error)
                return
            }

            completion(nil)
        }
    }

    private func requestAPI(with request: Request, completion: @escaping (Any?, Error?) -> Void) {
        var urlRequest = URLRequest(url: apiURL)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: ["query": request.body], options: [])

        print("Request body")
        print(String(data: urlRequest.httpBody!, encoding: .utf8)!)
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
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
                guard let dataContainer = dict?["data"]  as? [String: Any] else {
                    NSLog("No data in request response.")
                    completion(nil, NSError(domain: "No data in response.", code: 0, userInfo: nil))
                    return
                }

                var queryContainer:[String: Any]?

                let payloadString = request.payload.rawValue

                if request.name == "monsterFetch" {
                    guard let queryContainer = dataContainer["userById"] as? [String: Any] else {
                        completion(nil, NSError(domain: "Query container is nil.", code: 0, userInfo: nil))
                        return
                    }
                    completion(queryContainer[payloadString], nil)
                    return
                } else {
                    queryContainer = dataContainer[request.name] as? [String: Any]
                }


                guard let parser = self.parsers[request.payload] else {
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
