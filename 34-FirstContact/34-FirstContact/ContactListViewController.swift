//
//  ViewController.swift
//  34-FirstContact
//
//  Created by Chris Stomp on 11/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var tableSortedSegementedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    var people: Results<Person>!
    var currentCreateAction: UIAlertAction!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        people = realm.objects(Person).sorted("name")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int 
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        let aPerson = people[indexPath.row]
        cell.textLabel?.text = aPerson.name
        cell.detailTextLabel?.text = "\(aPerson.contactCount)"
        
        return cell
    }
    
    @IBAction func addFriend(sender: UIBarButtonItem)
    {
        let alertController = UIAlertController(title: "Add Person", message: "Type the person's name.", preferredStyle: UIAlertControllerStyle.Alert)
        currentCreateAction = UIAlertAction(title: "Create", style: .Default) { (action) -> Void in
            let personName = alertController.textFields?.first?.text
            let newPerson = Person()
            newPerson.name = personName!
            
            try! self.realm.write({ () -> Void in
                self.realm.add(newPerson) //saves person object to realm
                self.tableView.reloadData() //reload to have person appear
            })
            
        }
        
        alertController.addAction(currentCreateAction)//add createAction from above to the alert controller
        currentCreateAction.enabled = false  //set to false to start so button is off as default
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alertController.addTextFieldWithConfigurationHandler {(textField) -> Void in
            
            textField.placeholder = "Name"
            textField.addTarget(self, action: "personNameFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged) //runs every time the text field changes
            
        }
        
        self.presentViewController(alertController, animated: true, completion: nil) //causes pop up to appear
    }
    
    @IBAction func changeSortCriteria(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            people = people.sorted("name")
        }
        else
        {
            people = people.sorted("contactCount", ascending: false)
        }
        
        tableView.reloadData()
    }

    
    func personNameFieldDidChange(sender: UITextField)
    {
        self.currentCreateAction.enabled = sender.text?.characters.count > 0 //set to false above in alert controller
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let personDetailVC = storyboard?.instantiateViewControllerWithIdentifier("PersonDetailViewController") as! PersonDetailViewController
        personDetailVC.person = people[indexPath.row]
        navigationController?.pushViewController(personDetailVC, animated: true)
    }


}





