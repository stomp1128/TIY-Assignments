//
//  SearchViewController.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

protocol FoursquareAPIResultsProtocol
{
    func didReceiveFoursquareAPIResults(results: NSDictionary)
}


class VenueSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FoursquareAPIResultsProtocol
{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var delegate: VenueSearchDelegate?
    var venues = [NSManagedObject]()
    var apiDelegate: APIController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Venue Search"
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Search Bar
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        let term = searchBar.text
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        searchQueryToAPIController(term!)
    }
    
    
    // MARK: - Foursquare API
    func searchQueryToAPIController(searchTerm: String)
    {
        self.apiDelegate = APIController(foursquareDelegate: self)
        apiDelegate.searchFoursquareFor(searchTerm)
    }
    
    func didReceiveFoursquareAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
        var venuesArray = [NSManagedObject]()
        venuesArray = Venue.searchResultsJSON(results)
        self.venues = venuesArray
        
            self.tableView.reloadData() })
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return venues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell", forIndexPath: indexPath)
        let aVenue = venues[indexPath.row]
        
        cell.textLabel!.text = aVenue.valueForKey("name") as? String
        cell.detailTextLabel!.text = aVenue.valueForKey("address") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let venue = venues[indexPath.row]
        delegate?.venueWasSelected(venue)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Action Handlers
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem)
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}