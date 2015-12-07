//
//  Location.swift
//  22-Dude-Where's-My-Car?
//
//  Created by Chris Stomp on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

let klocationNameKey = "locationName" //step 12

let kLatitudeKey = "latitude"
let kLongitudeKey = "longitude"

class Location: NSObject, NSCoding
{
    let locationName: String
    let latitude: Double
    let longitude: Double
    
    init(locationName: String, latitude: Double, longitude: Double)
    {
        self.locationName = locationName
        self.latitude = latitude
        self.longitude = longitude 
    }
    
    // MARK: - NSCoding //step 11
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let locationName = aDecoder.decodeObjectForKey(klocationNameKey) as? String,
              let latitude = aDecoder.decodeObjectForKey(kLatitudeKey) as? Double,
              let longitude = aDecoder.decodeObjectForKey(kLongitudeKey) as? Double
            
            else {return nil}
        
        self.init(locationName: locationName, latitude: aDecoder.decodeDoubleForKey(kLatitudeKey), longitude: aDecoder.decodeDoubleForKey(kLongitudeKey))
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.locationName, forKey: klocationNameKey)
        
        aCoder.encodeObject(self.latitude, forKey: kLatitudeKey)
        aCoder.encodeObject(self.longitude, forKey: kLongitudeKey)
    }

}
