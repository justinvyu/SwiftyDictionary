//
//  ViewController.swift
//  SwiftyDictionary
//
//  Created by Justin Yu on 11/25/2015.
//  Copyright (c) 2015 Justin Yu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyDictionary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let thesaurus = Thesaurus(key: "3331ed63-3bb7-417a-b930-e309e402b54a")
//        thesaurus.fetchSynonyms("test", limit: 0)

        Alamofire.request(.GET, "http://www.dictionaryapi.com/api/v1/references/thesaurus/xml/test?key=3331ed63-3bb7-417a-b930-e309e402b54a")
                 .responseString { response in
                        print(response)
                 }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

