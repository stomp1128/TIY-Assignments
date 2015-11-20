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
    var people: Results<Contact>!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        people = realm.objects(Contact).sorted("name")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int //step 4
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return people.count
    }


}

