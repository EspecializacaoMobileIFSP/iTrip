//
//  DriveData.swift
//  iTrip
//
//  Created by Denis Oliveira on 9/25/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import Foundation

class DriveData {
    
    func getPlaces() -> String? {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1nNYhZlJwX_8vdu607_5eZGMMMGVlEG76d_WKf4753xM/pub?gid=0&single=true&output=tsv")
        do {
            return try String(contentsOf: url!)
        } catch {
            return ""
        }
    }
    
    func getCheckList() -> String? {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1FE3OJ07b4UmH1vhHZAm4fFXWTjgob5NbWLjNEwINgMI/pub?gid=0&single=true&output=tsv")
        do {
            return try String(contentsOf: url!)
        } catch {
            return ""
        }
    }
}
