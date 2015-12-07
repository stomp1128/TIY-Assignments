//
//  PlayerTableViewCell.swift
//  CollectEmAll-Sports
//
//  Created by Chris Stomp on 11/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class PlayerInfoCell: UITableViewCell
{
    
    @IBOutlet weak var jerseyNumberLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var positionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
