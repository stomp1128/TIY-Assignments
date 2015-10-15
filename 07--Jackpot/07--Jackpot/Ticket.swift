//
//  Ticket.swift
//  07--Jackpot
//
//  Created by Chris Stomp on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Ticket
{
    var ticketNumbers = Array<Int>()
    init()
    {
        
        for _ in 1...6
        {
           createAndAddNumber()
        }
    }
    
    func createAndAddNumber()
    {
        var pickFound = false
        repeat
        {
            let aPick = Int(arc4random() % 53 + 1)
            if !ticketNumbers.contains(aPick)
            {
                ticketNumbers.append(aPick)
                pickFound = true
            }
        } 
        while !pickFound
    }
    
    func description() -> String
    {
        var ticketString = ""
        for aNumber in ticketNumbers
        {
           ticketString = ticketString + "\(aNumber) "
        }
        return ticketString
    }
}

