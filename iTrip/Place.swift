//
//  Place.swift
//  iTrip
//
//  Created by Denis Oliveira on 9/25/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import Foundation
import UIKit

class Place {
    
    var title:String?
    var countryName:String?
    var country:String?
    var place:String?
    var details:String?
    
    init(string:String) {
        let components = string.components(separatedBy: "\t")
        
        self.title = components[0]
        self.countryName = components[1]
        self.country = components[2]
        self.place = components[3]
        self.details = components[4]
    }
    
    func description() -> String {
        return "Title: \(self.title)\nCountry: \(self.countryName)\nDetails: \(self.details)\n"
    }
}
