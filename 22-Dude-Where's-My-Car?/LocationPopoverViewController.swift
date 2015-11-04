//
//  LocationPopoverViewController.swift
//  22-Dude-Where's-My-Car?
//
//  Created by Chris Stomp on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation

class LocationPopoverViewController: UIViewController, CLLocationManagerDelegate
    
{
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addCurrentLocationButton: UIButton!
    
    var locations = [Location]()
    let locationManager = CLLocationManager() //step 3 create objects
    let geocoder = CLGeocoder()
    
    var delegate: LocationPopoverViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationTextField.becomeFirstResponder()
        addCurrentLocationButton.enabled = false
        configureLocationManager()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(locationTextField: UITextField) -> Bool
    {
        
        var rc = false
        
        if locationTextField.text != ""
        {
        resignFirstResponder()
        configureLocationManager()
        locationManager.startUpdatingLocation()
            
            rc = true
        }
        return rc
    }
    
    //MARK: - CLLocation related Methods //step 4
    
    func configureLocationManager()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted //determines if user said its ok to use location
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //updates when user moves
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined //if not determined we have not asked the user yet, its the first time the app has been run
            {
                locationManager.requestWhenInUseAuthorization() //ios will take over and ask your user for permission
                //requestAlwaysAuthorization will allow it to get users location in background
            }
            else
            {
                addCurrentLocationButton.enabled = true
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
          addCurrentLocationButton.enabled = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
            
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                
                
                let latitude = location?.coordinate.latitude
                let longitude = location?.coordinate.longitude
                //let aLocation = Location(locationName: locationName, latitude: latitude!, longitude: longitude!)
                
               // self.delegate?.locationWasChosen(aLocation)
            }
        })
        
    }
    
    @IBAction func addLocationTapped(sender: AnyObject)
    {
        locationManager.startUpdatingLocation()
        resignFirstResponder()
    }
    




}
