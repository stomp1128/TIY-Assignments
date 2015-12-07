//
//  APIController.swift
//  CollectEmAll-Sports
//
//  Created by Chris Stomp on 11/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: APIControllerProtocol
    var task: NSURLSessionDataTask!
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    func searchSportsRadarFor()
    {
        
        let url = NSURL(string: "https://api.sportradar.us/ncaafb-t1/teams/FSU/roster.json?api_key=87beufkd23wtgqxxxd9wdyas")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            
            print("Task completed") //useful for debugging
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let dictionary = parseJSON(data!) //must use self because we are inside of a closure
                {
                    if let players : NSArray = dictionary["players"] /*get value of results key */ as? NSArray 
                    {
                        self.delegate.didReceiveAPIResults(players)
                        
                    }
                }
            }
        })
        
        task.resume() //used to start the process coded above
    }
    
func searchImages ()
    {
//        let url = NSURL(string: "http(s)://api.sportradar.us/[ncaafb]-images-[t][1]/[usat]/players/[actionshots]/[asset_id]/[filename].[format]?api_key=[your_api_key]")
        let url = NSURL(string: "https://api.sportradar.us/ncaafb-images-t1/schema/manifest-v1.0.json?api_key=87beufkd23wtgqxxxd9wdyas")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                if let dictionary = parseJSON(data!)
                {
                    if let players : NSArray = dictionary["players"] as? NSArray
                    {
                        self.delegate.didReceiveAPIResults(players)
                    }
                }
            }
        })
        
        task.resume()
    }
    

    }

func parseJSON(data: NSData) -> NSDictionary? //step 11 create a function to parse json
{
    do
    {
        let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
        return dictionary
    }
    catch let error as NSError
    {
        print(error)
        return nil
    }
}


