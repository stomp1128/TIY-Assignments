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
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
