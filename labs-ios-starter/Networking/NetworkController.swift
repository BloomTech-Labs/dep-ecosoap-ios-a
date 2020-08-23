//
//  NetworkController.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class BackendController {
    private let apiURL: URL = URL(string: "https://ecosoap-placeholder.herokuapp.com/graphql")!

    var loggedInUser: User

    var users: [String: User] = [:]
    var properties: [String: Property] = [:]
    var pickups: [String: Pickup] = [:]

    private var parsers: [String: (Any?)->()] = [:]

    private var propertyParser: (Any?) -> Void = {_ in }
    private var propertiesParser: (Any?) -> Void = {_ in }
    private var userParser: (Any?) -> Void = {_ in }
    private var pickupParser: (Any?) -> Void = {_ in }

    init(user: User) {
        self.loggedInUser = user

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

        self.parsers = ["properties":propertyParser,
        "property":propertiesParser,
        "user":userParser,
        "pickup":pickupParser]

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

            property.stats = stats
            completion(nil)

        }
    }

    private func queryAPI(query: Queries.Key, id: String, completion: @escaping (Any?, Error?) -> Void) {
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: ["query":Queries.shared.collection[query.rawValue]!(id)], options: [])
        
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
                let queryContainer = dataContainer?[query.rawValue] as? [String: Any]

                let payloadString = Queries.shared.payloads[query.rawValue]!

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
