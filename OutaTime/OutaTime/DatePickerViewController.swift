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
    
    var delegate: DatePickerDelegate?
    //optional ? because it does not need to have a value
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)//do whatever the super class does then add functionality, line 29
        delegate?.dateWasChosen(datePicker.date)
        //this data will be sent to TimeCircutsViewController
        //optional says if there is a value run the func, if not do not run
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
