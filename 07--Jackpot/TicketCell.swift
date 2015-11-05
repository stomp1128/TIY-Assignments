//
//  TicketCell.swift
//  07--Jackpot
//
//  Created by Chris Stomp on 10/21/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell
{
    
    @IBOutlet weak var numbersLabel: UILabel!
    @IBOutlet weak var payoutLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
