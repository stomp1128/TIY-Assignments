//
//  Player.swift
//  CollectEmAll-Sports
//
//  Created by Chris Stomp on 11/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Player
{
    let name: String
    let birthPlace: String
    let highSchool: String
    let height: Int
    let weight: Int
    let position: String
    let jerseyNumber: Int
    let experience: String
    
    init(name: String, birthPlace: String, highSchool: String, height: Int, weight: Int, position: String, jerseyNumber: Int, experience: String)
    {
        self.name = name
        self.birthPlace = birthPlace
        self.highSchool = highSchool
        self.height = height
        self.weight = weight
        self.position = position
        self.jerseyNumber = jerseyNumber
        self.experience = experience
    }
    
    static func playersWithJson(results: NSArray) -> [Player] //static because it is a func that can only be run on player class
    {
        var players = [Player]()
        
        if results.count > 0 // check to see if you have results in the array
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
            
                players.append(Player(name: name!, birthPlace: birthPlace!, highSchool: highSchool, height: height!, weight: weight!, position: position!, jerseyNumber: jerseyNumber!, experience: experience))
            }
        }
        return players
    }

}

