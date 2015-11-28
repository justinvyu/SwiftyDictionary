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

public class Thesaurus: Reference {

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

    public func fetchSynonymsWithSeparation(word: String, callback: SeparatedArrayCallback) {

    }


    func parseSynonymData(word: String, data: AEXMLDocument) -> [String] {
        var synonymArray: [String] = []
        print(data.root["entry"].allWithAttributes([ "id" : word ]))

        // Remove entries that don't match the word
        if let relevantWords = data.root["entry"].allWithAttributes([ "id" : word ]) {
            for term in relevantWords {
                for def in term["sens"].all! {
                    var synonyms = def["syn"].value?.componentsSeparatedByString(", ")

                    synonyms = synonyms!.map { synonym in
                        var split = synonym.componentsSeparatedByString(" ")

                        // Filter for only words that matter
                        split = split.filter {
                            !$0.containsString("(") && !$0.containsString(")")
                            && !$0.containsString("[") && !$0.containsString("]")
                        }

                        return split.joinWithSeparator(" ")
                    }

                    // Need to test again for a word like big(s)
                    let noRepeat = synonyms!.filter { $0 != word && !$0.containsString("(") && !$0.containsString(")") }
                    synonymArray += noRepeat
                }
            }
        }
        return uniq(synonymArray) // remove double entries
    }
}