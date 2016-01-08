//
//  ListTableViewCell.swift
//  12-InDueTimeRedux
//
//  Created by Chris Stomp on 12/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell
{
    
    @IBOutlet weak var item: UITextField!
    

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
