//
//  Hero.swift
//  S.H.I.E.L.D. Hero Tracker
//
//  Created by Chris Stomp on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Hero
{
    var name: String
    var homeworld: String
    var powers: String
    var image: String
    
    init(heroDictionary: NSDictionary)
        
    {
        name = heroDictionary["name"] as! String
        homeworld = heroDictionary["homeworld"] as! String
        powers = heroDictionary["powers"] as! String
        image = heroDictionary["image"] as! String
    }

}
