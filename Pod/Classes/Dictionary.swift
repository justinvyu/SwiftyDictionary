//
//  Dictionary.swift
//  Pods
//
//  Created by Justin Yu on 11/26/15.
//
//

import Foundation

public class SwiftyDictionary: Reference {

    // MARK: - Public Methods

    public func fetchDefinition(forWord word: String, callback: ArrayCallback) {
        let request = DictionaryRequest(word: word, action: .Dictionary, key: apiKey)
        request.makeAPIRequest() { data in
            // data.root["entry"]["def"]["ssl"].value
            
//            print(data.root["entry"]["def"]["ssl"].value)

            for entry in data.root["entry"].all! {
                if let id: String = entry.attributes["id"] {
                    let newId = id.componentsSeparatedByString("[")[0]
                    if newId != word {
                        return
                    }

                    var definitions: [String] = []

                    for def in entry["def"].all! {
                        for dt in def["dt"].all! {
                            let newVal = dt.stringValue.stringByReplacingOccurrencesOfString(":", withString: "")
                            if newVal != "" {
                                definitions.append(newVal)
                            }
                        }
                    }

                    callback(definitions)

                }
            }
        }
    }

    // MARK: - Data Extraction

}