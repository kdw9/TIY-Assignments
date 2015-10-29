//
//  Model.swift
//  The Grial Diary
//
//  Created by Keron Williams on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class Model

{
    var name: String
    var location: String
    var datebuilt: String
    
    init(modelDictionary: NSDictionary)
    {
       name = modelDictionary["name"] as! String
        location = modelDictionary["location"] as! String
        datebuilt = modelDictionary["datebuilt"] as!
        String 
    }

}