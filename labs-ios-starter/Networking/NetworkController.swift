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
    

    func queryAPI(query: Queries.Key, id: String, completion: @escaping (Any?, Error?) -> Void) {
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


                if query == .propertiesByUserId {
                    let payloadContainer = queryContainer?[Queries.shared.payloads[query.rawValue]!] as? [[String: Any]]
                    completion(payloadContainer, nil)
                } else {
                    let payloadContainer = queryContainer?[Queries.shared.payloads[query.rawValue]!] as? [String: Any]
                    completion(payloadContainer, nil)
                }

            } catch let error {
                completion(nil, error)
            }
        }.resume()
        
    }
}
