//
//  SiteDetailViewController.swift
//  The Grail Diary
//
//  Created by Chris Stomp on 10/21/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class SiteDetailViewController: UIViewController {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var distanceFromOrlando: UILabel!
    @IBOutlet weak var Fact: UILabel!
    
    var sites = Sites?()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
