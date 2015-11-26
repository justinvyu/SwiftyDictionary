//
//  Thesaurus.swift
//  Pods
//
//  Created by Justin Yu on 11/25/15.
//
//

import Foundation
import Alamofire
import AEXML

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

    // MARK: - Public Methods

    public func fetchSynonyms(word: String, callback: ArrayCallback) {
        let request = DictionaryRequest(word: word, action: .Thesaurus, key: apiKey)
        request.makeAPIRequest() { data in
            let synonymArray = self.parseSynonymData(word, data: data)
            callback(synonymArray)
        }
    }

    public func fetchSynonyms(word: String, limit: Int, callback: ArrayCallback) {
        let request = DictionaryRequest(word: word, action: .Thesaurus, key: apiKey)
        request.makeAPIRequest() { data in
            let synonymArray = self.parseSynonymData(word, data: data)
            callback(Array(synonymArray.prefix(limit)))
        }
    }

    func parseSynonymData(word: String, data: AEXMLDocument) -> [String] {
        var synonymArray: [String] = []
        for term in data.root.children {
            for def in term["sens"].all! {
                var synonyms = def["syn"].value?.componentsSeparatedByString(", ")
                synonyms = synonyms!.map({ synonym in
                    return synonym.componentsSeparatedByString(" ")[0]
                })
                let noRepeat = synonyms!.filter { $0 != word }
                synonymArray += noRepeat
            }
        }
        return uniq(synonymArray)
    }
}