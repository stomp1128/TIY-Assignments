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
    var location: String
    var distanceFromOrlando: String
    var fact: String
    
    init(siteDictionary: NSDictionary)
        
    {
        location = siteDictionary["name"] as! String
        distanceFromOrlando = siteDictionary["homeworld"] as! String
        fact = siteDictionary["powers"] as! String
    }
    
}

