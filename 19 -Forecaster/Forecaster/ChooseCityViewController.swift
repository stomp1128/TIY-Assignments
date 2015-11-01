//
//  ChooseCityViewController.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


class ChooseCityViewController: UIViewController, UITextFieldDelegate
    
{
    
    @IBOutlet weak var zipTextField: UITextField!
    
    var delegate: ChooseCityViewControllerDelegate?
    
//    var  api: APIController!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        zipTextField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func validateZipCode(zipCode: String) -> Bool
    {
        let characterSet = NSCharacterSet(charactersInString: "0123456789")
        if zipCode.characters.count == 5 && zipCode.rangeOfCharacterFromSet(characterSet)?.count == 0
        {
            return true
        }
        else
        {
            return false
        }
        
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipTextField.text != ""
        {
            if validateZipCode(zipTextField.text!) == true
            {
                rc = true
                search(zipTextField.text!)
            }
            
        }
        
        else
        {
            zipTextField.text = ""
            zipTextField.placeholder = "Enter a valid zip"
        }
        
        return rc
    }
    
    // MARK: - Action Handlers
    
    @IBAction func findCity(sender: UIButton)
    {
       
        search(zipTextField.text!)
    }
    
    @IBAction func cancel(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func search(zip: String)
    {
        print(zip)
        
        
        delegate?.didReceiveZip(zip)
        self.dismissViewControllerAnimated(true, completion: nil)

    }

}
