//
//  VenueTableViewCell.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell
{
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

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
