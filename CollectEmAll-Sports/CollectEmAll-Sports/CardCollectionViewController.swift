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
        title = "2015 Florida State Seminoles"
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
        cell.nameLabel.text = player.name 
        //cell.imageView.image =
        
       return cell
    }
    
   
    //Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        let aPlayer = visiblePlayers[indexPath.item]
        let vc = storyboard?.instantiateViewControllerWithIdentifier("PlayerDetailViewController") as! PlayerDetailViewController
        vc.player = aPlayer
        navigationController?.pushViewController(vc, animated: true)
        
        return true
    }
    
//    func collectionView(collectionView: UICollectionView, didDeslectItemAtIndexPath indexPath: NSIndexPath)
//    {
//        let cell = collectionView.cellForItemAtIndexPath(indexPath) as UICollectionViewCell?
//        
//    }

    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
        
    {
        return .None //swift automatically knows that .None is a member of UIModalPresentaionStyle so you dont need to type it
    }
    
    //Mark: - CharacterListTableViewController Delegate
    
    func playerWasChosen(chosenPlayer: Player)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
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
