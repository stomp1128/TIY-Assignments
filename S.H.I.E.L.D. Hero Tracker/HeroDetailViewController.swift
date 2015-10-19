//
//  HeroDetailViewController.swift
//  S.H.I.E.L.D. Hero Tracker
//
//  Created by Chris Stomp on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroDetailViewController: UITableViewController
{

    @IBOutlet weak var HomeworldLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    
    var hero = Hero?()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
