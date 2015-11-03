//
//  WeatheraLocationTableViewCell.swift
//  Forecaster
//
//  Created by Keron Williams on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class WeatherLocationTableViewCell: UITableViewCell
{

    @IBOutlet weak var numberDegreeLabel: UILabel!
    @IBOutlet weak var weatherLocationLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var weathericon: UIImageView!
    
    
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
