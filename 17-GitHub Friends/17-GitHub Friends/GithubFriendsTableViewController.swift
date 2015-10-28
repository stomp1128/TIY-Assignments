//
//  ViewController.swift
//  17-GitHub Friends
//
//  Created by Chris Stomp on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func didReceiveAPIResults(results: NSArray)
}

class GithubFriendsTableViewController: UITableViewController, APIControllerProtocol
{
   // let textField = UITextField(frame: CGRect(x: 0, y: 160, width: 200, height: 50))
    
    var api: APIController!
    var friends = [Friend]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        api = APIController(delegate: self)
        api.searchGitHubFor("")
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int //step 5
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int //step 5
    {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell //step 6
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
        
        return cell
    }
    
    // MARK: - API Controller Protocol
    
    func didReceiveAPIResults(results: NSArray)
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.friends = Friend.friendsWithJson(results)
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }



}

