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
    
    var  api: APIController!
    

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
        var rc = false
        _ = NSCharacterSet(charactersInString: "0123456789")
        if zipCode.characters.count == 5 /*&& zipCode.rangeOfCharacterFromSet(characterSet)?.count == 0*/ && zipTextField.text != ""
        {
            rc = true
        }
        else
        {
            zipTextField.text = ""
            zipTextField.placeholder = "Enter a valid zip"
        }

        return rc
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if validateZipCode(zipTextField.text!)
        {
            rc = true
            search(zipTextField.text!)
        }
        
        return rc
    }
    
    // MARK: - Action Handlers
    
    @IBAction func findCity(sender: UIButton)
    {
        if validateZipCode(zipTextField.text!)
        {
            search(zipTextField.text!)
        }
    }
    
    @IBAction func cancel(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func search(zip: String)
    {
        // print(zip)
        delegate?.didReceiveZip(zip)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
