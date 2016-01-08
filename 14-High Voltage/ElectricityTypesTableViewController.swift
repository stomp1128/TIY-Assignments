//
//  ElectricityTypesTableView.swift
//  14-High Voltage
//
//  Created by Chris Stomp on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ElectricityTypesTableViewController: UITableViewController
{
    var types: [String]?
    var delegate: ElectricityTypesTableViewControllerDelegate?

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
        return types!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ElectricityTypesCell", forIndexPath: indexPath)

        // Configure the cell...
    
        let aType = types?[indexPath.row]
        cell.textLabel?.text = aType

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) 
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.typeWasChosen((types?[indexPath.row])!)
    }

    

   
}
