//
//  ListCell.swift
//  Due Time
//
//  Created by Chris Stomp on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell
{
    @IBOutlet weak var list: UITextField!
    @IBOutlet weak var completed: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
