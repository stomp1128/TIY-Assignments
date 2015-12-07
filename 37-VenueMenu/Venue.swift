//
//  Venue.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Venue: NSManagedObject
{
    // MARK: - Parse JSON
    
    static func searchResultsJSON(results: NSDictionary) -> [NSManagedObject]
    {
        var venueResults = [NSManagedObject]()
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let venueArray = results.valueForKey("venues") as? NSArray
        
        for venue in venueArray!
        {
            //thanks RW: http://www.raywenderlich.com/115695/getting-started-with-core-data-tutorial
            let venueEntity = NSEntityDescription.entityForName("Venue", inManagedObjectContext: managedObjectContext)
            let aVenue = Venue(entity: venueEntity!,
                insertIntoManagedObjectContext: nil)
            
            aVenue.setValue(venue.valueForKey("name") as? String ?? "", forKey: "name")
            let location = venue.valueForKey("location") as? NSDictionary
            aVenue.setValue(location?.valueForKey("address") as? String ?? "", forKey: "address")
            aVenue.setValue(0, forKey: "rating")
            aVenue.setValue(false, forKey: "userLike")
            aVenue.setValue(location?.valueForKey("lat") as? Double ?? 0.0, forKey: "lat")
            aVenue.setValue(location?.valueForKey("lng") as? Double ?? 0.0, forKey: "lng")
            
            do {
                try managedObjectContext.save()
                venueResults.append(aVenue)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
            
        }
        
        return venueResults
    }
    
    static func venueWithJSON(results: NSDictionary) -> [NSManagedObject]
    {
        var venueResults = [NSManagedObject]()
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let venueArray = results.valueForKey("venues") as? NSArray
        
        for venue in venueArray!
        {
            //thanks RW: http://www.raywenderlich.com/115695/getting-started-with-core-data-tutorial
            let venueEntity = NSEntityDescription.entityForName("Venue", inManagedObjectContext: managedObjectContext)
            let aVenue = NSManagedObject(entity: venueEntity!,
                insertIntoManagedObjectContext: managedObjectContext)
            
            aVenue.setValue(venue.valueForKey("name") as? String, forKey: "name")
            let location = venue.valueForKey("location") as? NSDictionary
            aVenue.setValue(location?.valueForKey("address") as? String, forKey: "address")
            aVenue.setValue(0, forKey: "rating")
            aVenue.setValue(false, forKey: "userLike")
            aVenue.setValue(location?.valueForKey("lat") as? Double, forKey: "lat")
            aVenue.setValue(location?.valueForKey("lng") as? Double, forKey: "lng")
            
            do {
                try managedObjectContext.save()
                venueResults.append(aVenue)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
            
        }
        
        return venueResults
    }
    
}