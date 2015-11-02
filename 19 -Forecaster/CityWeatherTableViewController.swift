//
//  CityWeatherTableViewController.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


protocol ChooseCityViewControllerDelegate
{
    func didReceiveZip(zip: String)
}

protocol APIControllerProtocol //step 13, add below in class list as well
{
    func didReceiveAPIResults(results: NSArray)
    func didReceiveDarkSkyAPIResults(results: NSDictionary, city: City)
}


class CityWeatherTableViewController: UITableViewController, APIControllerProtocol, ChooseCityViewControllerDelegate
{
    var api: APIController!
    var cities = Array<City>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api = APIController(delegate: self)
        
        title = "Forecaster"
        
        didReceiveZip("32801")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
        
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityWeatherCell", forIndexPath: indexPath) as! CityWeatherCell

        
        let city = cities[indexPath.row]
        
        cell.cityLabel?.text = city.cityName
        
        if city.weather != nil
        {
            cell.weatherCondition.text = city.weather!.condition
            
            let fullTemp = String(city.weather!.temperature).componentsSeparatedByString(".")
            var formattedTemp = Int(fullTemp[0])
            let decimalPlace = fullTemp[1]
            if Int(decimalPlace) > 50
            {
                formattedTemp! += 1
            }
            
            cell.temperature.text = String(formattedTemp!)
        }

        
        return cell
    }
    
    func didReceiveZip(zip: String)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        api = APIController(delegate: self)
        api.searchForCity(zip)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ZipSegue"
        {
            let zipVC = segue.destinationViewController as! ChooseCityViewController
            zipVC.delegate = self
        }
        
    }
    
    
    
    // MARK: - API Controller Protocol
    
    func didReceiveAPIResults(results: NSArray)
    {
        dispatch_async(dispatch_get_main_queue(), {
//            self.cities.append(City.citiesWithJson(results))
            
            let city = City.citiesWithJson(results)
            self.cities.append(city)
            
            let api = APIController(delegate: self)
            api.searchForWeather(city)
            
            
           // print(results)
            self.tableView.reloadData()
//            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    func didReceiveDarkSkyAPIResults(currently: NSDictionary, city: City)
    {
        dispatch_async(dispatch_get_main_queue(),
            {
                
            let weather = Weather.WeatherWithJson(currently)
            
            for eachCity in self.cities
            {
                if city.cityName == eachCity.cityName
                {
                    eachCity.weather = weather
                }
            }
            // print(results)
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let city = cities[indexPath.row]
        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("WeatherDetail") as! WeatherDetailViewController
        detailVC.city = city
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
