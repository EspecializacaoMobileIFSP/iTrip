//
//  ImageCache.swift
//  iTrip
//
//  Created by Denis Oliveira on 9/29/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import Foundation
import UIKit

let cache = NSCache<NSString, UIImage>()

class ImageCache {
    
    open func get(with string: String?, complete:@escaping (UIImage?) -> Void) {
        if (string != nil) {
            if let cached = cache.object(forKey: string! as NSString) {
                complete(cached)
            } else {
                do {
                    let url = URL(string: string!)
                    if (url != nil) {
                        URLSession.shared.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                            if (error != nil) {
                                print(error)
                                return
                            }
                            
                            if (data != nil) {
                                let image = UIImage(data: data!)
                                cache.setObject(image!, forKey: string! as NSString)
                                complete(image)
                            }
                        }).resume()
                    }
                }
            }
        }
    }
    
}
