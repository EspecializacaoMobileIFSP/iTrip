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
    
    override func prepareForReuse() {
        self.titleLabel?.text = ""
        self.descriptionLabel?.text = ""
        self.placeImageView.image = nil
    }
    
    func updateWithPlace(place: Place) {
        self.titleLabel?.text = place.title
        self.descriptionLabel?.text = place.countryName
        
        let weakSelf = self
        ImageCache().get(with: place.country) { (image: UIImage?) in
            weakSelf.countryImageView?.image = image
        }
        ImageCache().get(with: place.place) { (image: UIImage?) in
            weakSelf.placeImageView?.image = image
        }
    }
}
