//
//  Sites.swift
//  The Grail Diary
//
//  Created by Chris Stomp on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Sites
{
    
    var name: String
    var location: String
    var distanceFromOrlando: String
    var fact: String
        
        init(dictionary: NSDictionary)
        {
            name = dictionary["name"] as! String
            location = dictionary["location"] as! String
            distanceFromOrlando = dictionary["distanceFromOrlando"] as! String
            fact = dictionary["fact"] as! String
        }
    
}

