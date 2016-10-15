//
//  DetailViewController.swift
//  iTrip
//
//  Created by Denis Oliveira on 9/24/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = self.place?.countryName
        
        let backButton = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backTap(sender:)))
        backButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
        
        self.clean()
        self.titleLabel?.text = self.place?.title
        self.descriptionLabel?.text = self.place?.details
        
        ImageCache().get(with: self.place?.place) { (image: UIImage?) in
            self.placeImageView?.image = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func clean() {
        self.titleLabel?.text = ""
        self.descriptionLabel?.text = ""
        self.placeImageView?.image = nil
    }
    
    func updateWithPlace(place: Place) {
        self.place = place
    }
    
    func backTap(sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
