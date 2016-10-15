//
//  CheckListHeaderView.swift
//  iTrip
//
//  Created by Denis Oliveira on 10/14/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import UIKit

class CheckListHeaderView: UITableViewHeaderFooterView {

    @IBOutlet var categoryLabel: UILabel!
    
    override func prepareForReuse() {
        categoryLabel?.text = ""
    }

}
