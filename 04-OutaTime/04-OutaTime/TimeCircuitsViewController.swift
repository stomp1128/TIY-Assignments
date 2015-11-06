//
//  TimeCircuitsViewController.swift
//  04-OutaTime
//
//  Created by Chris Stomp on 11/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate
{
    func dateWasChosen(date: NSDate)
}

class TimeCircuitsViewController: UIViewController, DatePickerDelegate
{
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var timer: NSTimer?
    var currentSpeed = 0
    let dateFormatter = NSDateFormatter()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Time Circuits"
        
        let dateString = formatTime(NSDate())
        
        destinationTimeLabel.text = "_ _ _ _ _ _ _ _ _"
        presentTimeLabel.text = dateString
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "_ _ _ _ _ _ _ _ _"

    }


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDatePickerSegue"
        {
            let datePickerVC = segue.destinationViewController as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func travelBackTapped(sender: UIButton)
    {
        
        startTimer()
        updateSpeed()
    }
    
    func formatTime(timeToFormat: NSDate) -> String
    {
        self.dateFormatter.dateStyle = .MediumStyle
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let formattedTime = dateFormatter.stringFromDate(timeToFormat)
        return String(formattedTime)
    }
    
    func dateWasChosen(date: NSDate)
    {
        destinationTimeLabel.text = dateFormatter.stringFromDate(date)
    }
    
    func startTimer()
    {
        if timer == nil
        {
           timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateSpeed", userInfo: nil, repeats: true)
        }
        
    }
    
    func updateSpeed()
    {
        if currentSpeed < 88
        {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        }
        else
        {
            stopTimer()
        }
    }
    
    func stopTimer()
    {
        timer?.invalidate()
        speedLabel.text = "0" //String(currentSpeed)
        presentTimeLabel.text = destinationTimeLabel.text
        lastTimeDepartedLabel.text = formatTime(NSDate())
        
    }
    
}
