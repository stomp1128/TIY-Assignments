//
//  Weather.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Weather
{
    
    var temperature: Double
    var feelsLike: Double
    var chanceOfRain: Double
    var condition: String
    var icon: String
    
    init(temperature: Double, feelsLike: Double, chanceOfRain: Double, condition: String, icon: String)
    {
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.chanceOfRain = chanceOfRain
        self.condition = condition
        self.icon = icon
    }
    
    static func WeatherWithJson(results: NSDictionary) -> Weather
    {
        var weather: Weather
        var temperature = 0.0
        var apparentTemperature = 0.0
        var chanceOfRain = 0.0
        var summary = ""
        var icon = ""
        
        if results.count > 0
        {
            temperature = results["temperature"] as! Double

            apparentTemperature = results["apparentTemperature"] as! Double
                
            chanceOfRain = results["precipProbability"] as! Double
            
            summary = results["summary"] as! String
            
            icon = results["icon"] as! String
        }
        
        weather = Weather(temperature: temperature, feelsLike: apparentTemperature, chanceOfRain: chanceOfRain, condition: summary, icon: icon)
        return weather
    }
}