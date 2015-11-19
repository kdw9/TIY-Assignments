//
//  APIController.swift
//  Forecaster
//
//  Created by Keron Williams on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
//1.) this is the bridge of communication from the protocol the this current class
    var delegator : APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
     self.delegator = delegate
    }
    
    
    func googleLocationAp(zipcodeSearchTerm: String)
    {
       let google = zipcodeSearchTerm.stringByReplacingOccurrencesOfString(" " , withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        
        if let googleL = google.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())
        {
            let url: String = "https://maps.googleapis.com/maps/api/geocode/json?components=postal_code:"+googleL+"&sensor=false"
            let NSurl = NSURL(string: url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(NSurl!, completionHandler: { (data, response, error) -> Void in
                print("Completed Task Google")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                if let dictionary = self.parseJSON(data!)
                 {
        
                        if let results: NSArray = dictionary["results"] as? NSArray
                        {
                            if let result = results[0] as? NSDictionary
                            {
                                let address = result["formatted_address"] as! String
                                let cityName = address.componentsSeparatedByString(",")[0]
                                if let geometry = result["geometry"] as? NSDictionary
                                {
                                    if let location = geometry ["location"] as?NSDictionary
                                    {
                                       let area = location["lat"] as! Double
                                       let areaTwo = location["lng"] as! Double
                                       let city = City(cityName: cityName, zip: zipcodeSearchTerm, lat: area, lng: areaTwo)
                                        self.delegator.cityWasFound(city)

                                    }
                                }
                                
                            }
                        }
                    }
                 
                }
            })
            task.resume()
      
        }
        
    }
    
    
    func parseJSON(data:NSData) -> NSDictionary?
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary; return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    
    }
}




    
