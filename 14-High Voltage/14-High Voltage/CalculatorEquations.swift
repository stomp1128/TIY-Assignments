//
//  Calculator Equations.swift
//  14-High Voltage
//
//  Created by Chris Stomp on 10/23/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class CalculatorEquations
{

    var watts = 0.0
    var volts = 0.0
    var ohms = 0.0
    var amps = 0.0
    var result = 0.0
    
    
    func equations() -> Double
    {
        
        if volts != 0.0 && amps != 0.0
        {
            ohms = volts / amps
            watts = volts * amps
        }
        if volts != 0.0 && watts != 0.0
        {
            ohms = (watts * watts) / volts
            amps = watts / volts
        }
        if volts != 0.0 && ohms != 0.0
        {
            watts = volts * ohms
            amps = volts / ohms
        }
        
        if watts != 0.0 && ohms != 0.0
        {
           volts = (watts * ohms) / 2
            amps = (watts / ohms) / 2
        }
        if watts != 0.0 && amps != 0.0
        {
            volts = watts / amps
            ohms = watts / (amps * amps)
        }
        if amps != 0.0 && ohms != 0.0
        {
            volts = amps * ohms
            watts = (amps * amps) * ohms
        }
        
        return result
    }
    
    func performCalculation()
    {
        var count = 0
        if volts != 0
        {
            count++
        }
        if watts != 0
        {
            count++
        }
        if amps != 0
        {
            count++
        }
        if ohms != 0
        {
            count++
        }
        if count > 1
        {
            equations()
        }
    
    }

}