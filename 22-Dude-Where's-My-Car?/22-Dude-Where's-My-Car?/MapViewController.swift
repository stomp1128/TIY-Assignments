//
//  ViewController.swift
//  22-Dude-Where's-My-Car?
//
//  Created by Chris Stomp on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol LocationPopoverViewControllerDelegate //step 31
{
    func locationWasChosen(chosenLocation: String)
}


class MapViewController: UIViewController, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) 
    {
        if segue.identifier == "showPopoverSegue"
        {
            let destinationViewController = segue.destinationViewController as!LocationPopoverViewController
            
            destinationViewController.popoverPresentationController?.delegate = self
            //destinationViewController.delegate = self //step 33
            let contentHeight =  CGFloat(44.0)
            destinationViewController.preferredContentSize = CGSizeMake(200.0, contentHeight)
        }
    }
    
    func locationWasChosen(chosenLocation: String)
    {
        
    }

}

