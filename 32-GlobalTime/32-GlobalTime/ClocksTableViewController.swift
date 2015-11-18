//
//  TimeZonesTableViewController.swift
//  32-GlobalTime
//
//  Created by Chris Stomp on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import Foundation

protocol TimeZoneTableViewControllerDelegate 
{
    func timeZoneWasChosen(chosenTimeZone: String)
}

class ClocksTableViewController: UITableViewController, UIPopoverControllerDelegate, TimeZoneTableViewControllerDelegate
{
    var visibleTimeZones = [String]()
    let allTimeZones = NSTimeZone.knownTimeZoneNames()
    var remainingTimeZones = NSTimeZone.knownTimeZoneNames()
    
        
    @IBOutlet weak var plusButton: UIBarButtonItem!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return visibleTimeZones.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClockCell", forIndexPath: indexPath) as! ClockCell
        
        let timeZone = visibleTimeZones[indexPath.row]
        cell.timeZoneLabel.text = timeZone
        
        cell.clockView.timezone = NSTimeZone(name: timeZone)

        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            visibleTimeZones.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowTimeZonesSegue"
            
        {
            let DestViewController = segue.destinationViewController as! UINavigationController
            let targetController = DestViewController.topViewController as! TimeZoneTableViewController
            //let destinationVC = segue.destinationViewController as! TimeZoneTableViewController
            targetController.timeZones = remainingTimeZones
           // destinationVC.popoverPresentationController?.delegate = self
            targetController.delegate = self
            
//            UINavigationController *navC = segue.destinationViewController;
//            ChooseMovieViewController *chooseMovieVC = navC.viewControllers[0];
        }
    }
    
    
    //MARK: - UIPopoverPresentationController Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
        
    {
        return .None //swift automatically knows that .None is a member of UIModalPresentaionStyle so you dont need to type it
    }
    
    func timeZoneWasChosen(chosenTimeZone: String) 
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        visibleTimeZones.append(chosenTimeZone)
        
        let rowToRemove = (remainingTimeZones as NSArray).indexOfObject(chosenTimeZone)
        remainingTimeZones.removeAtIndex(rowToRemove)
        if remainingTimeZones.count == 0
        {
            plusButton.enabled = false  
        }
        
        tableView?.reloadData()
    }
    
}
