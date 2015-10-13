//
//  Hero.swift
//  HeroTracker
//
//  Created by Keron Williams on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Hero
{
    var realName: String
    var coverName: String
    var accessLevel: Int
    
    init(dictionary: NSDictionary)
    {
    realName = dictionary["realName"] as! String
    coverName = dictionary["coverName"] as! String
    accessLevel = dictionary["accessLevel"] as! Int
        
    }
}