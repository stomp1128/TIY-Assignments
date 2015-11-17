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
    func timeZoneWasChosen(chosenCharacter: String)
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowTimeZonesSegue"
        {
            let destinationVC = segue.destinationViewController as! TimeZoneTableViewController
            destinationVC.timeZones = remainingTimeZones
           // destinationVC.popoverPresentationController?.delegate = self
            destinationVC.delegate = self
            //let contentHeight = 34.0 * CGFloat(remainingTimeZones.count) //tells how tall popover should be
            //destinationVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
        }
    }
    
    
    //Mark: - UIPopoverPresentationController Delegate // step 30
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
        //step 30
    {
        return .None //swift automatically knows that .None is a member of UIModalPresentaionStyle so you dont need to type it
    }
    
    func timeZoneWasChosen(chosenTimeZone: String) //
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil) //step 37
        visibleTimeZones.append(chosenTimeZone)
        
        let rowToRemove = (remainingTimeZones as NSArray).indexOfObject(chosenTimeZone)
        remainingTimeZones.removeAtIndex(rowToRemove)
        if remainingTimeZones.count == 0
        {
            plusButton.enabled = false //this needs to be added to storyboard and IBAction created in CCTV
        }
        
        
        tableView?.reloadData()
    }



}
