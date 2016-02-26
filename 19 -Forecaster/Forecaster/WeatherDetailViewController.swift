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
    //@IBOutlet weak var detailMap: MKMapView!
   // @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var chanceOfRain: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var temp: UILabel!
    
    var city: City?
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        dropAPin()
        
        let fullTemp = String(city!.weather!.temperature).componentsSeparatedByString(".")
        var formattedTemp = Int(fullTemp[0])
        let decimalPlace = fullTemp[1]
        if Int(decimalPlace) > 50
        {
            formattedTemp! += 1
        }
        temp.text = "\(formattedTemp!)°F"
        
        icon.image = UIImage(named: city!.weather!.icon)
        condition.text = city!.weather?.condition
        chanceOfRain.text = String(city!.weather!.chanceOfRain)
        let feels = String(city!.weather!.feelsLike).componentsSeparatedByString(".")
        var formattedFL = Int(feels[0])
        let feelsDecimal = feels[1]
        if Int(feelsDecimal) > 50
        {
            formattedFL! += 1
        }
        feelsLike.text = "Feels like \(formattedFL!)°F"
        
        let precip = String(city!.weather!.chanceOfRain).componentsSeparatedByString(".")
        var formattedPrecip = Int(precip[0])
        let precipDecimal = precip[1]
        if Int(precipDecimal) > 50
        {
            formattedPrecip! += 1
        }
        chanceOfRain!.text = "Precipitation \(formattedPrecip!)%"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func dropAPin()
//    {
//        let geocoder = CLGeocoder()
////        let location =
//        geocoder.geocodeAddressString(city!.cityName, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
//            if let placemark = placemarks?[0]
//            {
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = (placemark.location?.coordinate)!
//                annotation.title = self.city!.cityName
//                self.detailMap.addAnnotation(annotation)
//                let annotations = [annotation]
//                
//                self.detailMap.showAnnotations(annotations, animated: true)
//               
//                
//            }
//        })
//            
//    }

}
