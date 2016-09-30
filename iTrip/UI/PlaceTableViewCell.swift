//
//  PlaceTableViewCell.swift
//  iTrip
//
//  Created by Denis Oliveira on 9/23/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var countryImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithPlace(place: Place) {
        self.titleLabel?.text = place.title
        self.descriptionLabel?.text = place.countryName

        ImageCache().get(with: place.country) { (image: UIImage?) in
            self.countryImageView?.image = image
        }
        ImageCache().get(with: place.place) { (image: UIImage?) in
            self.placeImageView?.image = image
        }
    }
}
