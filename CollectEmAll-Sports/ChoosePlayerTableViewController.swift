//
//  ChoosePlayerTableViewController.swift
//  CollectEmAll-Sports
//
//  Created by Chris Stomp on 11/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


class ChoosePlayerTableViewController: UITableViewController

{
    var delegate: ChoosePlayerTableViewControllerDelegate?
    var remainingPlayers: [Player] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       remainingPlayers.sortInPlace({ $0.jerseyNumber < $1.jerseyNumber })
    
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
        return remainingPlayers.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerInfoCell", forIndexPath: indexPath) as! PlayerInfoCell

        let aPlayer = remainingPlayers[indexPath.row]
        cell.name?.text = aPlayer.name
        cell.jerseyNumberLabel.text = String(aPlayer.jerseyNumber)
        cell.positionLabel.text = aPlayer.position
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.playerWasChosen(remainingPlayers[indexPath.row])
    }

    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem!)
    {
       dismissViewControllerAnimated(true, completion: nil)
    }
    
}


