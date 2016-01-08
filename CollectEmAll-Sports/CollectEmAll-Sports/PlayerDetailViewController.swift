//
//  TeamDetailViewController.swift
//  CollectEmAll-Sports
//
//  Created by Chris Stomp on 11/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController
{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthPlace: UILabel!
    @IBOutlet weak var highSchool: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var jerseyNumber: UILabel!
    @IBOutlet weak var experience: UILabel!
    
    var player: Player?
       

    override func viewDidLoad()
    {
        super.viewDidLoad()
        name.text = "Name: \(player!.name)"
        birthPlace.text = "Born: \(player!.birthPlace)"
        highSchool.text = "High School: \(player!.highSchool)"
        
        let heightInFeet = (player!.height)/12
        let inches = (player!.height) % 12
        let heightString = "\(heightInFeet)\' \(inches)\""
        height.text = "Height: \(heightString)"
        
        weight.text = "Weight: \(player!.weight) lbs"
        position.text = "Position: \(player!.position)"
        jerseyNumber.text = "Number: \(player!.jerseyNumber)"
        experience.text = "Experience: \(player!.experience)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
}
