//
//  ClockCell.swift
//  32-GlobalTime
//
//  Created by Chris Stomp on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ClockCell: UITableViewCell
{
    
    @IBOutlet weak var clockView: ClockView!
    @IBOutlet weak var timezoneLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
