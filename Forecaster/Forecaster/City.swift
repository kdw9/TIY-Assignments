//
//  City.swift
//  Forecaster
//
//  Created by Keron Williams on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

// NSCoding Constants
//let kNameKey = "name"
//let kZipCodeKey = "zipCode"
//let kLatitude = "latitude"
//let kLongitude = "Longitude"


class City
{
    let cityName: String
    let zipCode: String
    let longitude: Double
    let latitude: Double
    
    // var weather: WeatherConditions?
    
    init(cityName: String, zip: String, lat: Double, lng: Double)
    {
        self.cityName = cityName
        self.zipCode = zip
        longitude = lat
        latitude = lng
        
    }
}