//
//  TimeZoneTableViewController.swift
//  32-GlobalTime
//
//  Created by Chris Stomp on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TimeZoneTableViewController: UITableViewController
{
    var timeZones: [String]?
    var delegate: TimeZoneTableViewControllerDelegate?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return timeZones!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timeZoneListCell", forIndexPath: indexPath)

        // Configure the cell...
        let aTimeZone = timeZones?[indexPath.row]
        cell.textLabel?.text = aTimeZone

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) //step 36
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.timeZoneWasChosen((timeZones?[indexPath.row])!)
    }


}
