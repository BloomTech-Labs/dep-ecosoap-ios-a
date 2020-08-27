//
//  String.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/27/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

extension String {

    func firstLetterCapitalizing() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func firstLetterCapitalized() {
        self = self.firstLetterCapitalizing()
    }

}
