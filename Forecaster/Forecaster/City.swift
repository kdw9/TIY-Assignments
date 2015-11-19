//
//  City.swift
//  Forecaster
//
//  Created by Keron Williams on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

 // NSCoding Constants
let kNameKey = "name"
let kZipCodeKey = "zipCode"
let kLatitude = "latitude"
let kLongitude = "Longitude"


class City: NSObject
{
    let cityName: String
    let zipCode: String
    let longitude: Double?
    let latitude: Double?
    var currentWeather: Weather?
    
    // var weather: WeatherConditions?
    
    init(cityName: String, zip: String, lat: Double, lng: Double, weather: Weather?)
    {
        self.cityName = cityName
        self.zipCode = zip
        longitude = lat
        latitude = lng
        
        if weather != nil
        {
            self.currentWeather = weather!
        }
        else
        {
            self.currentWeather = nil
        }
        
    }
    
    // MARK: - NSCoding (serialization)
    
    
}

//    // MARK: - NSCoding (serialization)
//    
//    required convenience init?(coder aDecoder: NSCoder)
//    {
//        // guard = if the 2 statements after guard are true, continue to self.init code. otherwise move to else statment and break
//        guard let name = aDecoder.decodeObjectForKey(kNameKey) as? String, let zipCode = aDecoder.decodeObjectForKey(kZipCodeKey) as? String
//            else { return nil }
//        
//        self.init(name: name, zip: zipCode, lat: aDecoder.decodeDoubleForKey(kLatitudeKey), lng: aDecoder.decodeDoubleForKey(kLongitudeKey))
//        
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder)
//    {
//        aCoder.encodeObject(self.name, forKey: kNameKey)
//        aCoder.encodeObject(self.zipCode, forKey: kZipCodeKey)
//        aCoder.encodeDouble(self.lat!, forKey: kLatitudeKey)
//        aCoder.encodeDouble(self.lng!, forKey: kLongitudeKey)
//    }
//    
//    // MARK: - Parse JSON
//    
//    static func cityWithJSON(results: NSDictionary) -> City
//    {
//        var aCity: City!
//        
//        if results.count > 0
//        {
//            
//            let formattedAddress = results.valueForKey("formatted_address") as? String
//            let addressComponents = formattedAddress!.characters.split(",").map { String($0) }
//            let name =  addressComponents[0]
//            let geometry = results.valueForKey("geometry") as? NSDictionary
//            
//            let location = geometry!.valueForKey("location") as? NSDictionary
//            
//            
//            aCity = (City(name: name, location: location!, weather: nil))
//            
//        }
//        return aCity
//    }
//    
//    
//}