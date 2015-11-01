//
//  CityWeatherCell.swift
//  Forecaster
//
//  Created by Chris Stomp on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CityWeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
