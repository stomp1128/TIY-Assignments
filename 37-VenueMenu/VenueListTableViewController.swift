//
//  VenueListTableViewController.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

/*Cocoa Pods Installed for https://github.com/prolificinteractive/NavigationControllerBlurTransition/tree/master/Example/NavigationControllerBlurTransition*/


protocol VenueSearchDelegate
{
    func venueWasSelected(venue: NSManagedObject)
}

class VenueListTableViewController: UITableViewController, VenueSearchDelegate
{
    var venues = Array<NSManagedObject>()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Favorite Venues"
        
        let fetchRequest = NSFetchRequest(entityName: "Venue")
        do {
            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Venue]
            venues = fetchResults!
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return venues.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("VenueTableViewCell", forIndexPath: indexPath) as! VenueTableViewCell
        
        let aVenue = venues[indexPath.row]
        cell.venueLabel.text = aVenue.valueForKey("name") as? String
        cell.ratingLabel.text = aVenue.valueForKey("rating") as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            let aVenue = venues[indexPath.row]
            venues.removeAtIndex(indexPath.row)
            managedObjectContext.deleteObject(aVenue)
            saveContext()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowSearchModal"
        {
            let destVC = segue.destinationViewController as! UINavigationController
            let modalVC = destVC.viewControllers[0] as! VenueSearchViewController
            modalVC.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let venueDetailVC = storyboard?.instantiateViewControllerWithIdentifier("VenueDetailViewController") as! VenueDetailViewController
        venueDetailVC.indexRow = indexPath.row
        venueDetailVC.venuesDetail = venues
        navigationController?.pushViewController(venueDetailVC, animated: true)
    }
    
    
    // MARK: - Add Contact Delegate
    
    func venueWasSelected(venue: NSManagedObject)
    {
        
        managedObjectContext.insertObject(venue)
        venues.append(venue)
        saveContext()
        tableView.reloadData()
    }
    
    
    // MARK: - Private functions
    
    private func saveContext()
    {
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
}