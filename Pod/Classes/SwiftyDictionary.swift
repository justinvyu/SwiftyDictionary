//
//  SwiftyDictionary.swift
//  Pods
//
//  Created by Justin Yu on 11/25/15.
//
//

import Foundation
import Alamofire

public enum SwiftyDictionaryType {
    case Dictionary
    case Thesaurus
}

struct SwiftyDictionary {
    static let API_ROOT_PATH = NSURL(string: "https://www.dictionaryapi.com/api/v1/references/")
}