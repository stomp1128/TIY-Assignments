//
//  EquationsTableViewController.swift
//  14-High Voltage
//
//  Created by Chris Stomp on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol ElectricityTypesTableViewControllerDelegate
{
    func typeWasChosen(chosenType: String)
}

class ElectricityCalculatorTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, ElectricityTypesTableViewControllerDelegate {
    
    var electricityTypes = [String]()
    var remainingElectricityTypes = ["Watts", "Volts", "Ohms", "Amps"]
    let brain = CalculatorEquations()
    
    
    @IBOutlet weak var plusButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        title = "Electricity Calculator"

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
        return electricityTypes.count 
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ElectricityCalculatorCell", forIndexPath: indexPath) as! ElectricityCalculatorCell

        // Configure the cell...
        
        let electricityType = electricityTypes[indexPath.item]
        cell.nameLabel.text = electricityType
                
        return cell
    }
    

   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowElectricityTypesPopoverSegue"
        {
            let destVC = segue.destinationViewController as! ElectricityTypesTableViewController
            destVC.types = remainingElectricityTypes
            destVC.popoverPresentationController?.delegate = self
            
            destVC.delegate = self
            
            let contentHeight = 44.0 * CGFloat(remainingElectricityTypes.count) //tells how tall popover should be
            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)

        }
        
    
    }
    
    //Mark: - UIPopoverPresentationController Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
        
    {
        return .None //swift automatically knows that .None is a member of UIModalPresentaionStyle so you dont need to type it
    }
    
    //Mark: - CharacterListTableViewController Delegate
    
    func typeWasChosen(chosenType: String) -> Double
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil) 
        electricityTypes.append(chosenType)
        
        let rowToRemove = (remainingElectricityTypes as NSArray).indexOfObject(chosenType)
        remainingElectricityTypes.removeAtIndex(rowToRemove)
        if remainingElectricityTypes.count == 2
        {
            plusButton.enabled = false 
        }
        
        tableView?.reloadData()
    }
    
  /*  @IBOutlet weak var clearButtonTapped: UIBarButtonItem!
    {
    
    } */
    
    
}
