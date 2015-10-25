//
//  HighVoltageTableViewCell.swift
//  High Voltage
//
//  Created by Keron Williams on 10/25/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HighVoltageTableViewCell: UITableViewCell
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
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
