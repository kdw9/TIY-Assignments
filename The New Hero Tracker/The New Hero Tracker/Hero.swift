//
//  Hero.swift
//  The New Hero Tracker
//
//  Created by Keron Williams on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Hero
{
    var name: String
    var homeWorld: String
    var power: String
    
    init(heroDictionary: NSDictionary)
    {
        name = heroDictionary["name"] as! String
        homeWorld = heroDictionary["homeWorld"] as! String
        power = heroDictionary["power"] as! String
    }
}