//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Chris Stomp on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController
{
    
    @IBOutlet var datePicker:UIDatePicker!
    
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
