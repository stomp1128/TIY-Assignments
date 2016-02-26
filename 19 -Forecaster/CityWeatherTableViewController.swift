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

class CityWeatherTableViewController: UITableViewController {
   
    var cities = [City]()
    var weather: Weather?
    var city: City?
    var api: APIController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api = APIController(delegate: self)
        title = "Forecaster"
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
            cell.icon?.image = UIImage(named: city.weather!.icon)
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ZipSegue"
        {
            let zipVC = segue.destinationViewController as! ChooseCityViewController
            zipVC.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let city = cities[indexPath.row]
        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("WeatherDetail") as! WeatherDetailViewController
        detailVC.city = city
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete {
            
            cities.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}

extension CityWeatherTableViewController: ChooseCityViewControllerDelegate {
    
    func didReceiveZip(zip: String)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        api = APIController(delegate: self)
        api.searchForCity(zip)
    }
}

extension CityWeatherTableViewController: APIControllerProtocol {
    // MARK: - API Controller Protocol
    func didReceiveAPIResults(results: NSArray)
    {
        dispatch_async(dispatch_get_main_queue(), {
            //self.cities.append(City.citiesWithJson(results))
            
            let city = City.citiesWithJson(results)
            self.cities.append(city)
            
            let api = APIController(delegate: self)
            api.searchForWeather(city)
            
            print(results)
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
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
                print(currently)
                self.tableView.reloadData()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
}
