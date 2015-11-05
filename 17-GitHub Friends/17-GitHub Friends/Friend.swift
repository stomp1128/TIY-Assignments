//
//  Friend.swift
//  17-GitHub Friends
//
//  Created by Chris Stomp on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct Friend
{
    struct Friend //step 15 create a new file and struct
    {
        let name: String
        let company: String
        let blog: String
        let location: String
        
        init (name: String, company: String, blog: String, location: String)
        {
            self.name = name
            self.company = company
            self.blog = blog
            self.location = location
           
        }
        
        static func friendsWithJson(results: NSArray) -> [Friend]
        {
            var friends = [Friend]()
            
            if results.count > 0 // check to see if you have albums in the array
            {
                for result in results
                {
                    let name = result["name"] as? String
                    
                    let company = result["company"] as? String
                    
                    
                    let blog = result["blog"] as? String ?? ""
                    let location = result["location"] as? String ?? ""
                    
                    friends.append(Friend(name: name!, company: company!, blog: blog, location: location))
                }
            }
            return friends
        }

    }
 
}
