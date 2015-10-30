//
//  APIController.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController

{
    
    var delegate: APIControllerProtocol!
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }

    
    func searchForCity(zipCode: String)
    {
    
        let urlPath = "http://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(zipCode)&sensor=false"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
        if error != nil
        {
           print(error!.localizedDescription) //we can unwrap error because we know its not nil
        }
        else
        {
            if let dictionary = self.parseJSON(data!) //must use self because we are inside of a closure
            {
                if let results : NSArray = dictionary["results"] /*get value of results key */ as? NSArray //step 12 if we get dictionary use this to view results key
                {
                    self.delegate.didReceiveAPIResults(results)
                }
            }
        }
    })
        task.resume() 
    }
    
       //used to start the process coded above
        
        
    
    
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

}
