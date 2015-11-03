//
//  Location.swift
//  Forecaster
//
//  Created by Keron Williams on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class Weather
{
    var tempreture: String
    var weatherIcon: String
    var windSpeed: String
    var condition: String
    var humidity: String
    var feelsLike: String
    
    init (weatherDictionary: NSDictionary)
    {
        tempreture = weatherDictionary["tempreture"] as! String
        weatherIcon = weatherDictionary["Image"] as! String
        windSpeed = weatherDictionary["windSpeed"] as! String
        condition = weatherDictionary["condition"] as! String
        humidity = weatherDictionary["humidity"] as! String
        feelsLike = weatherDictionary["feelsLike"] as! String
        
    }
    
    
}