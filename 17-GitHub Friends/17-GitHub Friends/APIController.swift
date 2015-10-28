//
//  APIController.swift
//  17-GitHub Friends
//
//  Created by Chris Stomp on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }

    func searchGitHubFor (searchTerm: String)
    {
        
        
        let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet()) //taking the search term converting them to be used in the URL
        // %20 is an example as a replacement for a space in the URL
        
       // {
            let urlPath = "https://api.github.com/users/search?term=\(escapedSearchTerm)jcgohlke" //anything after search? begins the request
            let url = NSURL(string: urlPath) //step 10 creat NSURL object
            let session = NSURLSession.sharedSession() //step 10
            let task = session.dataTaskWithURL(url! /*object from above */, completionHandler: {data, response, error -> Void in
                print("Task completed") //useful for debugging
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    if let dictionary = parseJSON(data!) //must use self because we are inside of a closure
                    {
                        if let results : NSArray = dictionary["results"] /*get value of results key */ as? NSArray //step 12 if we get dictionary us this to view results key
                        {
                            self.delegate.didReceiveAPIResults(results)
                        }
                    }
                }
            })
        
            task.resume() //used to start the process coded above
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
