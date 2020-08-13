//
//  NetworkController.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class BackendController {
    private let apiURL: URL = URL(string: "ecosoap-placeholder.herokuapp.com/graphiql")!
    
    private var encoder = JSONEncoder()
    private var decoder = JSONDecoder()
    
    func queryAPI(completion: @escaping (String, Any?) -> Void) {
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: ["query":Queries.statsById], options: [])
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
                completion("No bueno", nil)
                return
            }
            
            guard let data = data else {
                completion("No Data", nil)
                return
            }
            
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                completion("We got stuff", dict)
            } catch let error {
                completion("No cigar", nil)
            }
        }.resume()
        
    }
}
