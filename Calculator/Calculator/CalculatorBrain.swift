//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Chris Stomp on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    var operation = ""
    var operand1 = ""
    var operand2 = ""
    
    func addDigit(digit: String) -> String
    {
        if operation == ""
        {
            operand1 += digit
            return operand1
        }
        else
        {
            operand2 += digit
            return operand2
        }
    }
    
    func addOperate(operate: String)
    {
        operation = operate
    }
    
    func calculate()
    {
               
    }
    
    func clearDisplay(clear: String)
    {
        
    }
    
}