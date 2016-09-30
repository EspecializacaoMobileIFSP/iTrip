//
//  ViewController.swift
//  iTrip
//
//  Created by Denis Oliveira on 9/23/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet var placesTableView: UITableView!
    
    var places = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        placesTableView.register(
            UINib(nibName: kPlaceTableViewCell, bundle: nil),
            forCellReuseIdentifier: kPlaceTableViewCell
        )
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        let drive:DriveData = DriveData()
        for string in (drive.get()?.components(separatedBy: "\n"))! {
            if string.contains("http") {
                let place = Place(string: string)
                places.append(place)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PlaceTableViewCell = tableView.dequeueReusableCell(withIdentifier: kPlaceTableViewCell, for: indexPath) as! PlaceTableViewCell
        cell.updateWithPlace(place: places[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller:DetailViewController = DetailViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(37)
    }
}

