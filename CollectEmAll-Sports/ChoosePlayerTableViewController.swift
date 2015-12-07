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
    
    //var remainingPlayers = [Player]()
    var remainingPlayers: [Player] = []
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       remainingPlayers.sortInPlace({ $0.jerseyNumber < $1.jerseyNumber })
        
//        var api: APIController!
//        api = APIController(delegate: self) 
//        api.searchSportsRadarFor()

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
    

   
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.playerWasChosen(remainingPlayers[indexPath.row])
        
        
        
//        let aPlayer = players[indexPath.row]
//        let vc = storyboard?.instantiateViewControllerWithIdentifier("ShowCardCollection") as! CardCollectionViewController
//        vc.player = aPlayer
//        navigationController?.pushViewController(vc, animated: true)

    }

    
        
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem!)
    {
       dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}


