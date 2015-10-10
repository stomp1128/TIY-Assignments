//
//  ViewController.swift
//  OutaTime
//
//  Created by Chris Stomp on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate
{
    func dateWasChosen(date: NSDate)
}

class OutaTimeViewController: UIViewController, DatePickerDelegate
{
    
    @IBOutlet var destinationTime: UILabel!
    @IBOutlet var presentTime: UILabel!
    @IBOutlet var lastTimeDeparted: UILabel!
    @IBOutlet var speed: UILabel!
    
    var timer: NSTimer?
    var currentSpeed = 0
    let dateFormatter : NSDateFormatter = NSDateFormatter()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let stringPT = formatTime(NSDate())
        
        
        presentTime.text = stringPT
        speed.text = "\(currentSpeed) MPH"
        //lastTimeDeparted.text = String(NSDate())
        //destinationTime.text =
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowOutaTimePickerSegue"
        {
            let datePickerVC = segue.destinationViewController as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
    //Mark: - DatePicker Delegate
    
    func dateWasChosen(date: NSDate)
    {
        destinationTime.text = "\(date)"
    }
    
    //MARK: - Action Handlers
    
    @IBAction func travelBackPressed(sender: UIButton)
    {
        startTimer()
        
    }
    
    //MARK: - Private
    
    func formatTime(timeToFormat: NSDate) -> String
    {
        self.dateFormatter.dateStyle = .MediumStyle
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let formattedTime = dateFormatter.stringFromDate(timeToFormat)
        return String(formattedTime)
    }
    
    private func startTimer()

    
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateSpeed", userInfo: nil, repeats: true)
    }
    
    func updateSpeed()
    
    
    {
       // let newSpeed = (Int(speed.text!)! + 1)
       // speed.text = String(newSpeed)
        
    }
    
    private func stopTimer()
    {
        timer?.invalidate()
        timer = nil
    }
    

}




