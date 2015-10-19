//
//  HeroTableViewController.swift
//  S.H.I.E.L.D. Hero Tracker
//
//  Created by Chris Stomp on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController
{
    
    var heroes = Array<Hero>() //create a variable for each hero in the array
    
    var name: String = ""
    var homeworld: String = ""
    var power: String = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "S.H.I.E.L.D. Hero Tracker"
        
        loadHeroes()

        
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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return heroes.count //return the number of heroes in the array
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HeroCell", forIndexPath: indexPath)
        
        let aHero = heroes[indexPath.row]
        cell.textLabel?.text = aHero.name
        cell.detailTextLabel?.text = aHero.homeworld
        
        return cell
    }
    
    
    
    func loadHeroes()
    {
        do
        {
            /*let filePath = NSBundle.mainBundle().pathForResource("heroes", ofType: "json") //inside the main app bundle, there's a file called NOC, that's of type JSON. assign that filepath to filePath
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let heroData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
            
            for heroDictionary in heroData
            {
                let aHero = Hero(heroDictionary: heroDictionary as! NSDictionary)
                
                heroes.append(aHero)*/
            let filePath = NSBundle.mainBundle().pathForResource("heroes", ofType: "json")
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let heroData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
            // 9 pull data out of the JSON file below
            for heroDictionary in heroData
            {
                // 11 below
                let aHero = Hero(heroDictionary: heroDictionary as! NSDictionary)
                
                //14 below
                heroes.append(aHero)
        
        }
                        
        }
        catch let error as NSError
        {
            print(error)
        }
    }
    
}
