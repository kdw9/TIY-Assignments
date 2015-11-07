//
//  WeatherAPI.swift
//  Forecaster
//
//  Created by Keron Williams on 11/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class WeatherAPIController
{
    var weatherDelegate: WeatherAPIResultsProtocol?
    
    init(weatherDelegate: WeatherAPIResultsProtocol)
    {
        self.weatherDelegate = weatherDelegate
    }
    
    
    func searchForecastFor(lat: Double, lng: Double)
    {
        let url = NSURL(string: "https://api.forecast.io/forecast/e9ed5df4f40ee6a7b4a2b1994684e80a/\(lat),\(lng)")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let weatherDictionary = self.parseJSON(data!)
                {
                    self.weatherDelegate!.didReceiveWeatherAPIResults(weatherDictionary)
                }
            }
        })
        task.resume()
    }
    
    
    
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
}