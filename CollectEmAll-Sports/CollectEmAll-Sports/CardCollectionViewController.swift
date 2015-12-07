//
//  CardCollectionViewController.swift
//  CollectEmAll-Sports
//
//  Created by Chris Stomp on 11/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func didReceiveAPIResults(results: NSArray)
}

protocol ChoosePlayerTableViewControllerDelegate
{
    func playerWasChosen(chosenPlayer: Player)
}

class CardCollectionViewController: UICollectionViewController, ChoosePlayerTableViewControllerDelegate, APIControllerProtocol
{

    var api: APIController!
    
    @IBOutlet weak var plusButton: UIBarButtonItem!
    var remainingPlayers = [Player]()
    var visiblePlayers = [Player]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "2016 Florida State Seminoles"
        //navigationItem.leftBarButtonItem = editButtonItem()
        
        api = APIController(delegate: self)
        api.searchSportsRadarFor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        {
            if segue.identifier == "ShowPlayerCells"
            {
                let navC = segue.destinationViewController as! UINavigationController
                let destinationVC = navC.viewControllers[0] as! ChoosePlayerTableViewController
                destinationVC.remainingPlayers = self.remainingPlayers
                
                destinationVC.delegate = self
                
            }
            
//            if segue.identifier == "ShowDetailView"
//            {
//                
//                let destinationVC = segue.destinationViewController as! PlayerDetailViewController
//                destinationVC.visiblePlayers = self.visiblePlayers
//                dismissViewControllerAnimated(true, completion: nil)
//            }
        
        
        }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return visiblePlayers.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CardCell", forIndexPath: indexPath) as! CardCell
        
        
        let player = visiblePlayers[indexPath.item]
        cell.nameLabel.text = player.name //step 17
        //cell.imageView.image =
        
        
       return cell
    }
    
   
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    
     //Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        let aPlayer = visiblePlayers[indexPath.item]
        let vc = storyboard?.instantiateViewControllerWithIdentifier("PlayerDetailViewController") as! PlayerDetailViewController
        vc.player = aPlayer
        navigationController?.pushViewController(vc, animated: true)
        
        if editing
        {
            
        }
        
        

        return true
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        let city = cities[indexPath.row]
//        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("WeatherDetail") as! WeatherDetailViewController
//        detailVC.city = city
//        navigationController?.pushViewController(detailVC, animated: true)
//    }

    

    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?)
    {
        
    }

    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
        //step 30
    {
        return .None //swift automatically knows that .None is a member of UIModalPresentaionStyle so you dont need to type it
    }
    
    //Mark: - CharacterListTableViewController Delegate
    
    func playerWasChosen(chosenPlayer: Player) //step 35
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil) //step 37
        visiblePlayers.append(chosenPlayer)
        
        let rowToRemove = (remainingPlayers as NSArray).indexOfObject(chosenPlayer)
        remainingPlayers.removeAtIndex(rowToRemove)
        if remainingPlayers.count == 0
        {
            plusButton.enabled = false        
        }
        
        
        collectionView?.reloadData()
    }
    
    func didReceiveAPIResults(results: NSArray)
    {
        
        dispatch_async(dispatch_get_main_queue(), {
            self.remainingPlayers = Player.playersWithJson(results)
            self.collectionView!.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    
}
