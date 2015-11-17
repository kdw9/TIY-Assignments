//
//  TheTimeZoneTableViewCell.swift
//  ClockZones
//
//  Created by Keron Williams on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TheTimeZoneTableViewCell: UITableViewCell
{
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var clockView: ClockView!
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
