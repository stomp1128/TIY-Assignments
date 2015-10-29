//
//  PopoverTableViewController.swift
//  MuttCutts
//
//  Created by Chris Stomp on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class PopoverTableViewController: UITableViewController, UITextFieldDelegate
{
    var textFieldArray = Array<String>()
    var delegate: PopoverTableViewControllerDelegate?
    
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.textFieldOne.delegate = self
        self.textFieldTwo.delegate = self

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        func textFieldShouldReturn(textField: UITextField) -> Bool
        {
            if textField == textFieldOne
            {
                if textFieldOne.text != ""
                {
                    textFieldTwo.becomeFirstResponder()
                }
            }
            
            else if textField == textFieldTwo
            {
                if textFieldTwo.text != "" && textFieldOne.text != ""
                {
                    textFieldTwo.resignFirstResponder()
                    self.dismissViewControllerAnimated(true, completion: {})
                    
                    textFieldArray.append(textFieldOne.text!)
                    textFieldArray.append(textFieldTwo.text!)
                    delegate?.citiesWereChosen(textFieldArray)
                }
                else
                {
                    textFieldOne.becomeFirstResponder()
                }
            
            }
            
            return true
        }
}
    

        

    

