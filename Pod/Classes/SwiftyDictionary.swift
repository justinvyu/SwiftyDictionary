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
public typealias SeparatedArrayCallback = ([[String]]) -> Void

struct SwiftyDictionary {
    static let API_ROOT_PATH = NSURL(string: "http://www.dictionaryapi.com/api/v1/references/")
}

func uniq<S : SequenceType, T : Hashable where S.Generator.Element == T>(source: S) -> [T] {
    var buffer = [T]()
    var added = Set<T>()
    for elem in source {
        if !added.contains(elem) {
            buffer.append(elem)
            added.insert(elem)
        }
    }
    return buffer
}