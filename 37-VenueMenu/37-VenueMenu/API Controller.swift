//
//  API Controller.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

import Foundation

class APIController
{
    var delegate: APIControllerProtocol
    var task: NSURLSessionDataTask!
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    func searchFourSquareFor (searchTerm: String)
    {
        
        let location = "Orlando, FL"
        let formattedLocation = location.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())
        let fourSquareSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet()) //taking the search term converting them to be used in the URL
       
        
        let url = NSURL(string: "https://api.foursquare.com/v2/venues/search?client_id=5DYRGESK3DXK4QO3Q322A2UH1FKT15DVRYOFJPFG3ZHV5W1T&client_secret=QGFP202XJG1W4WPRUGD003X5FZV2REFBVGIXCXRIMUSFFUAG&v=20151128&near=\(formattedLocation)&query=\(fourSquareSearchTerm)")
        
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
                    if let results : NSArray = dictionary["response"] /*get value of response key */ as? NSArray //step 12 if we get dictionary us this to view results key
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
