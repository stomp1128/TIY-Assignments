//
//  ViewController.swift
//  MuttCutts
//
//  Created by Chris Stomp on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit

protocol PopoverTableViewControllerDelegate 
{
    func citiesWereChosen(cities: [String])
}

class MapViewController: UIViewController, UIPopoverPresentationControllerDelegate, PopoverTableViewControllerDelegate
{
    var annotations = [MKPointAnnotation]()
    var placemarks = [CLPlacemark]()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distance: UILabel!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
        
       /* let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("Lakeland, FL", completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placemarks?[0]
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = "Lakeland, FL"
                self.mapView.addAnnotation(annotation)
            }
        })
        
        let tiyOrlando = CLLocationCoordinate2DMake(28.540923, -81.38216)
        let tiyOrlandoAnnotation = MKPointAnnotation()
        tiyOrlandoAnnotation.coordinate = tiyOrlando
        tiyOrlandoAnnotation.title = "The Iron Yard"
        tiyOrlandoAnnotation.subtitle = "Orlando"
        
        let tiyTampa = CLLocationCoordinate2DMake(27.770068, -82.63642)
        let tiyTampaAnnotation = MKPointAnnotation()
        tiyTampaAnnotation.coordinate = tiyTampa
        tiyTampaAnnotation.title = "The Iron Yard"
        tiyTampaAnnotation.subtitle = "Tampa"
        
        let annotations = [tiyOrlandoAnnotation, tiyTampaAnnotation]
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
        mapView.camera.altitude *= 2
        
        //        let viewRegion = MKCoordinateRegionMakeWithDistance(tiyOrlando, 2000, 2000)
        //        mapView.setRegion(viewRegion, animated: true) */
        
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowCityLIstPopoverSegue"
        {
           let destVC = segue.destinationViewController as! PopoverTableViewController
           destVC.popoverPresentationController?.delegate = self
           destVC.delegate = self
           destVC.preferredContentSize = CGSizeMake(200.0, 128)
        }
    }
    
    //Mark: - UIPopoverPresentationController Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
        //step 30
    {
        return .None //swift automatically knows that .None is a member of UIModalPresentaionStyle so you dont need to type it
    }
    
    func citiesWereChosen(cities: [String])
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil) //step 37 //closes the popover
        
        for city in cities
        {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(city, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                if let placemark = placemarks?[0]
                {
                    self.placemarks.append(placemark)
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = (placemark.location?.coordinate)!
                    annotation.title = city
                    self.mapView.addAnnotation(annotation)
                    self.annotations.append(annotation)
                    if self.annotations.count == 2
                    {
                        self.mapView.addAnnotations(self.annotations)
                        self.mapView.showAnnotations(self.annotations, animated: true)
                        self.calculateDistance()
                    }
                }
            })

        }
    }

    func calculateDistance ()
    {
        let location1 = CLLocation(coordinate: (placemarks[0].location?.coordinate)!, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let location2 = CLLocation(coordinate: (placemarks[1].location?.coordinate)!, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let lineOfSightDistance = location1.distanceFromLocation(location2)
        
        distance.text = (String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
 
    }
    
}
