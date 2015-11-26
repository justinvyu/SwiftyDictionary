//
//  File.swift
//  Pods
//
//  Created by Justin Yu on 11/25/15.
//
//

import Foundation
import Alamofire
import AEXML

public class DictionaryRequest {

    // MARK: - Properties

    var word: String?
    var action: SwiftyDictionaryType?
    var apiKey: String?

    // MARK: - Lifecycle

    public init(word: String, action: SwiftyDictionaryType, key: String) {
        self.word = word
        self.action = action
        self.apiKey = key
    }

    // MARK: - Request Functions

    func makeAPIRequest(callback: DictionaryRequestCallback) {
        let url = getRequestUrl()
        Alamofire.request(.GET, url)
                 .responseData { response in
                    do {
                        if let data = response.data {
                            let formattedData = try AEXMLDocument(xmlData: data)
                            callback(formattedData)
                        }
                    }
                    catch {
                        print("\(error)")
                    }
                 }
    }

    func getRequestUrl() -> NSURL {
        var urlString = ""

        if let word = word, action = action, key = apiKey {
            urlString += "\(action == .Dictionary ? "collegiate" : "thesaurus")/xml/\(word)?key=\(key)"
        }
        return NSURL(string: urlString, relativeToURL: SwiftyDictionary.API_ROOT_PATH)!
    }

}