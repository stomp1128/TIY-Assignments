//
//  ViewController.swift
//  22-Dude-Where's-My-Car?
//
//  Created by Chris Stomp on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

let kLocationsKey = "locations"

protocol LocationPopoverViewControllerDelegate //step 31
{
    func locationWasChosen(location: Location)
}


class MapViewController: UIViewController, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate, LocationPopoverViewControllerDelegate
{
    
    var locations = Array<Location>()
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) 
    {
        if segue.identifier == "showPopoverSegue"
        {
            let destinationViewController = segue.destinationViewController as!LocationPopoverViewController
            
            destinationViewController.popoverPresentationController?.delegate = self
            destinationViewController.delegate = self //step 33
            destinationViewController.preferredContentSize = CGSizeMake(200.0, 100.0)
            
        }
    }
    
   func locationWasChosen(location: Location)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        locations.append(location)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    //MARK: - Misc.
    
    func loadLocationData() //step 15
    {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kLocationsKey) as? NSData
        {
            if let savedLocations = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Location]
            {
                locations = savedLocations
                //reloadData()
            }
        }
    }

    
    
    func saveLocationData() //step 13
    {
        let locationData = NSKeyedArchiver.archivedDataWithRootObject(locations)
        NSUserDefaults.standardUserDefaults().setObject(locationData, forKey: kLocationsKey)
    }

    
   
}

