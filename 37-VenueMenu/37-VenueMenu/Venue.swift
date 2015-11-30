//
//  Venue.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
import CoreData

class Venue: NSManagedObject
{
    static func venuesWithJson(results: NSArray) -> [Venue] //static because it is a func that can only be run on album class
    {
        var venues = [NSManagedObject]()
        
        if results.count > 0 // check to see if you have albums in the array
        {
            for result in results
            {
                let name = result["name_full"] as? String
                let birthPlace = result["birth_place"] as? String
                let highSchool = result["high_school"] as? String ?? ""
                let height = result["height"] as? Int
                let weight = result["weight"] as? Int
                
                let position = result["position"] as? String
                
                let jerseyNumber = result["jersey_number"] as? Int
                let experience = result["experience"] as? String ?? ""
                
                venues.append(Player(name: name!, birthPlace: birthPlace!, highSchool: highSchool, height: height!, weight: weight!, position: position!, jerseyNumber: jerseyNumber!, experience: experience))
            }
        }
        return venues

    
}

