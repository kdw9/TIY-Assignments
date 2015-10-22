//
//  TheVoltageCell.swift
//  High Voltage
//
//  Created by Keron Williams on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TheVoltageCell: UITableViewCell
{
    @IBOutlet weak var voltage: UILabel!
    @IBOutlet weak var unitInput: UITextField!
    
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
