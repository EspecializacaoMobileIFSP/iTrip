//
//  CheckList.swift
//  iTrip
//
//  Created by Denis Oliveira on 10/14/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import Foundation

class CheckList {
    
    var categories: [String: [String]]?
    
    init(checklist:String) {
        categories = [String: [String]]()
        for string in checklist.components(separatedBy: "\n") {
            let components = string.components(separatedBy: "\t")
            if (categories?[components[0]] == nil) {
                categories?[components[0]] = [String]()
            }
            categories?[components[0]]?.append(components[1])
        }
    }
}
