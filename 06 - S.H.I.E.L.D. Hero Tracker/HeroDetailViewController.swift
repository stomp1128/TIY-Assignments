//
//  HeroDetailViewController.swift
//  S.H.I.E.L.D. Hero Tracker
//
//  Created by Chris Stomp on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{

    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    

    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name: \(hero!.name)"
        homeworldLabel.text = "Homeworld: \(hero!.homeworld)"
        powersLabel.text = hero!.powers
        heroImage.image = UIImage(named: hero!.image)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
}
