//
//  SwiftyDictionary.swift
//  Pods
//
//  Created by Justin Yu on 11/25/15.
//
//

import Foundation
import Alamofire
import AEXML

public enum SwiftyDictionaryType {
    case Dictionary
    case Thesaurus
}

public typealias DictionaryRequestCallback = (AEXMLDocument) -> Void
public typealias ArrayCallback = ([String]) -> Void


struct SwiftyDictionary {
    static let API_ROOT_PATH = NSURL(string: "http://www.dictionaryapi.com/api/v1/references/")
}