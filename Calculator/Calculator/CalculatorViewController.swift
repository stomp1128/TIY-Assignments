//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Stomp on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController

{
    var brain = CalculatorBrain()
    
    
    @IBOutlet weak var displayWindow: UILabel!
    
    

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
    
    
    @IBAction func operatorButtonTapped(sender: UIButton)
    
    if operand1 != ""
    {
        let symbol = sender.currentTitle
        brain.addOperate(symbol!)
    }

    @IBAction func numberButtonTapped(sender: UIButton)
    
    {
        
        let number = sender.currentTitle
        displayWindow.text = brain.addDigit(number!)
        
        
    }
    
  //  @IBAction func clearButtonTapped(sender: UIButton)
    
     /*   {
            let clear = sender.currentTitle
            displayWindow.text = String(0)
        }*/
    
    @IBAction func equalButtonTapped(sender: UIButton)
    {
        
    }
    
    
}

