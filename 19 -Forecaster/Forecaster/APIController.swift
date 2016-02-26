//
//  APIController.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController

{
    var delegate: APIControllerProtocol!
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }

    func searchForCity(zipCode: String)
    {
        let urlPath = "https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(zipCode)&sensor=false"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            //print("Task completed")
        if error != nil
        {
           print(error!.localizedDescription) //we can unwrap error because we know its not nil
        }
        else
        {
            if let dictionary = self.parseJSON(data!) //must use self because we are inside of a closure
            {
                if let results : NSArray = dictionary["results"] /*get value of results key */ as? NSArray //step 12 if we get dictionary use this to view results key
                {
                    self.delegate.didReceiveAPIResults(results)
                   print(results)
                }
            }
        }
    })
        task.resume() 
    }
       //used to start the process coded above
    
    //MARK: - Weather
    func searchForWeather(city: City)
    {
        let lat = city.lat
        let long = city.long
        
        let urlPath = "https://api.forecast.io/forecast/01a833328e424cf215c54d02b12fa505/\(lat),\(long)"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
           // print("Task completed")
            if error != nil
            {
                print(error!.localizedDescription) //we can unwrap error because we know its not nil
            }
            else
            {
                if let dictionary = self.parseJSON(data!) //must use self because we are inside of a closure
                {
                    if let currently : NSDictionary = dictionary["currently"] /*get value of results key */ as? NSDictionary //step 12 if we get dictionary use this to view results key
                    {
                        self.delegate.didReceiveDarkSkyAPIResults(currently, city: city)
                    }
                }
            }
        })
        task.resume() 
    }
    
    func parseJSON(data: NSData) -> NSDictionary? //step 11 create a function to parse json
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
}
