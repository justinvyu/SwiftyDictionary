//
//  ViewController.swift
//  SwiftyDictionary
//
//  Created by Justin Yu on 11/25/2015.
//  Copyright (c) 2015 Justin Yu. All rights reserved.
//

import UIKit
import Alamofire
import AEXML
import SwiftyDictionary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let thesaurus = Thesaurus(key: "3331ed63-3bb7-417a-b930-e309e402b54a")

        thesaurus.fetchSynonymsWithSeparation("quickly") { results in
            for result in results {
                print(result)
            }
        }

//        thesaurus.fetchSynonymsWithSeparation("big") { results in
//            print(results)
//        }

    }

}

