//
//  CheckListTableViewCell.swift
//  iTrip
//
//  Created by Denis Oliveira on 10/14/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import UIKit

class CheckListTableViewCell: UITableViewCell {

    @IBOutlet var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.itemLabel?.text = ""
    }
}
