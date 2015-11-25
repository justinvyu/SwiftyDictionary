//
//  Thesaurus.swift
//  Pods
//
//  Created by Justin Yu on 11/25/15.
//
//

import Foundation

public class Thesaurus {

    // MARK: - Properties

    var apiKey: String!

    // MARK: - Lifecycle

    public init(key: String) {
        if authenticateKey(key) {
            apiKey = key
        }
    }

    // MARK: - Authenticating Key

    func authenticateKey(key: String) -> Bool {
        let keyArray = key.componentsSeparatedByString("-")
        if keyArray.count == 5 {
            return true
        }
        print("Error: Dictionary API key is not valid")
        return false
    }
}