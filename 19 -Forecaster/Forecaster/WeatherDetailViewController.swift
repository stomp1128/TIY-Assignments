//
//  WeatherDetailViewController.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class WeatherDetailViewController: UIViewController
{
    @IBOutlet weak var detailMap: MKMapView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var chanceOfRain: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var temp: UILabel!
    
    var city = City?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropAPin()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dropAPin()
    {
        let geocoder = CLGeocoder()
//        let location =
        geocoder.geocodeAddressString(city!.cityName, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placemarks?[0]
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = self.city!.cityName
                self.detailMap.addAnnotation(annotation)
                let annotations = [annotation]
                
                self.detailMap.showAnnotations(annotations, animated: true)
               
                
            }
        })
            
    }

}
