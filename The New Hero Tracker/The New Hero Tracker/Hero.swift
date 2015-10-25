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
    var homeworld: String
    var powers: String
    var heroImage: String
    
    init(heroDictionary: NSDictionary)
    {
        name = heroDictionary["name"] as! String
        homeworld = heroDictionary["homeworld"] as! String
        powers = heroDictionary["powers"] as! String
        heroImage = heroDictionary["heroImage"] as! String
    }
}