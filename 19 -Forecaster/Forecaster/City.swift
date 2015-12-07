//
//  City.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class City
{
    let cityName: String
    let lat: String
    let long: String
    var weather: Weather?
    
    init(cityName: String, lat: String, long: String, weather: Weather?)
    {
        self.cityName = cityName
        self.lat = lat
        self.long = long
            
        if weather != nil
        {
            self.weather = weather
        }
        else
        {
            self.weather = nil
        }
        
    }
    
    static func citiesWithJson(results: NSArray) -> City
    {
        var city: City
        var cityName = ""
        var latStr = ""
        var lngStr = ""
      
        
        if results.count > 0
        {
            for result in results
            {
                let formattedAddress = result["formatted_address"] as? String
                if formattedAddress != nil
                {
                    let addressComponentsForCity = formattedAddress!.componentsSeparatedByString(",")
                    cityName = String(addressComponentsForCity[0])
                }
                
                let geometry = result["geometry"] as? NSDictionary
                if geometry != nil
                {
                    let latLong = geometry?["location"] as? NSDictionary
                    if latLong != nil
                    {
                        let lat = latLong?["lat"] as! Double
                        let lng = latLong?["lng"] as! Double
                        
                        latStr = String(lat)
                        lngStr = String(lng)
                    }
                }
            }
        }
        
       // print(cityName) ; print(latStr) ; print(lngStr)

        city = City(cityName: cityName, lat: latStr, long: lngStr, weather: nil)
        return city
    }
    
}