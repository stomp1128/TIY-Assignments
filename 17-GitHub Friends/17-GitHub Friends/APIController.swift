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
    func searchGitHubFor (searchTerm: String)
    {
        let githubSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil) //itunes requests no spaces and + signs instead
        
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet()) //taking the search term converting them to be used in the URL
        // %20 is an example as a replacement for a space in the URL
    }
}
