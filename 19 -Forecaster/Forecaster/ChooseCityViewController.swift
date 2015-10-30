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
    //var  api: APIController!
    

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
        if zipTextField.text != ""
        {
            validateZipCode
         //   api.searchForCity(zipTextField.text!)
            
        }
        return true
    }
    
    // MARK: - Action Handlers
    
    @IBAction func findCity(sender: UIButton)
    {
        
    }
    
    @IBAction func cancel(sender: UIButton)
    {
        
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
