//
//  APIController.swift
//  GitHubFriends
//
//  Created by Keron Williams on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
// *** Application Programming Interface -this is how 2 computers talk to each other
class APIController
{
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    
    
    
//(1.) *** This function is creating a way to search ""GitHub" but various names in the form of String
    func searchGitHubFor(searchTerm: String)
    {
        let gitHubsearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: " ", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
//(2.Note) *** This is creating a space replacement in the URL search. Telling it to replace the space with %20. ex. "Keron%20Williams"
        if let escapedSearchTerm = gitHubsearchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())
        {
//(3.) *** This path is creating the URL path
            let urlPath = "https://api.github.com/users/CodeKhan01\(escapedSearchTerm)"
            let url = NSURL(string: urlPath)
            
//(4.) *** This session/task is compared to the URL wainting on you to give it something to do. It's constantly asking if there is anything to do?? The completion handler is a way for you to leave a note and walk away
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data,response, error -> Void
                in
                print("Task Completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    if let dictionary = self.parseJSON(data!)
                    {
                        //I just took out the string "results" and used "name" also changed NSArray for NSDictionary?
                        if let name: NSDictionary = dictionary["name"] as? NSDictionary
                        {
                            self.delegate.didReceiveAPIResults(name)
                        }
                    }
                }
            })
            task.resume()
        }
        
   }
//(5.) *** this will be how we receive the data from GitHub. the NSDictionary is an optional"?" meaning it will either return a Dictionary or it will return a nil
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
            
//(5a. Note) *** The above code Anything that can potentially throw an error put into this "do" block. "try" is simply saying try and run this dictionary and see if it works first befor sending it as an error
        }
    }
}














