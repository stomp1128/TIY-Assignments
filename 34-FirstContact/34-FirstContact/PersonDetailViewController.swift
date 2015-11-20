//
//  ContactDetailViewController.swift
//  34-FirstContact
//
//  Created by Chris Stomp on 11/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class PersonDetailViewController: UIViewController
    
{
    
    @IBOutlet weak var contactCountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let realm = try! Realm() //our way to talk to realm database
    var person: Person?
    var allPeople: Results<Person>!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateContactCountLabel() //step 14
    {
        contactCountLabel.text = "\(person!.name) has \(person!.contactCount) friend\(person!.contactCount == 1 ? "" : "s")" //either appends or does not depending on number of friends
    }
    
    // MARK: - UITableView Data Source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return allPeople.count
    }
    
    //step 17
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Add some friends"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
        
        let aPossibleContact = allPeople[indexPath.row]
        cell.textLabel?.text = aPossibleContact.name //step 15 to find if 2 people are friends
        let results = person!.people.filter("name == %@", aPossibleContact.name)
        if results.count == 1
        {
            cell.accessoryType = .Checkmark
        }
        else
        {
            cell.accessoryType = .None
        }
        
        
        return cell
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.None
        {
            cell?.accessoryType = .Checkmark
            try! realm.write { () -> Void in
                self.person!.people.append(self.allPeople[indexPath.row])
                self.person!.contactCount++ //do not use this in a real app
            }
            updateContactCountLabel()
        }
        else
        {
            cell?.accessoryType = .None
            try! realm.write { () -> Void in
                
                let index = self.person!.people.indexOf(self.allPeople[indexPath.row])
                self.person!.people.removeAtIndex(index!)
                self.person!.contactCount-- //dont do this because data is being stored in 2 places
                
            }
            updateContactCountLabel()
        }
    }

    

   
}
