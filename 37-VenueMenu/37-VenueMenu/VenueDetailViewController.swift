//
//  VenueDetailViewController.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class VenueDetailViewController: UIViewController
{
    //var annotations = [MKPointAnnotation]()
    //var placemarks = [CLPlacemark]()
    var venuesDetail = [NSManagedObject]()
    var indexRow = Int()
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupLabels()
        mapLocation()
     
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func setupLabels()
    {
        let venue = venuesDetail[indexRow]
        nameLabel.text = venue.valueForKey("name") as? String
        addressLabel.text = venue.valueForKey("address") as? String
        ratingLabel.text = venue.valueForKey("rating") as? String
    }
    
    // MARK: - Map Display
    
    func mapLocation()
    {
        
        let venue = venuesDetail[indexRow]
        let latitude: CLLocationDegrees = (venue.valueForKey("lat") as? Double)!
        let longitude: CLLocationDegrees = (venue.valueForKey("lng") as? Double)!
        let latDelta:CLLocationDegrees = 0.01
        
        let longDelta:CLLocationDegrees = 0.01
        
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let pointLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(pointLocation, theSpan)
        mapView.setRegion(region, animated: true)
        
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = venue.valueForKey("name") as? String
        self.mapView.addAnnotation(objectAnnotation)
    }
    
    @IBAction func cancelTapped(sender: UIBarButtonItem)
    {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }


}
    