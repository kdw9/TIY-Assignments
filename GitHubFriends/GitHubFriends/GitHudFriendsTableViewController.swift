//
//  ViewController.swift
//  GitHubFriends
//
//  Created by Keron Williams on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


protocol APIControllerProtocol
{
    func didReciveAPIResults(name: NSDictionary)
}
//(1.) *** Change the class name to ...TableViewController
class GitHudFriendsTableViewController: UITableViewController, APIControllerProtocol
{
// need notes here ***
    var api: APIController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        api = APIController(delegate: self)
        
//(3.) *** This section is simply the Yak Shaving for the Prototype cell. All I sm doing is Identifying the T.V.cell and registering the cell name. -After this step I need to create a new "API" class
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
//(2.) *** Create the Table View override function sections (Note to remember: This section is just like if I chose the TableViewController Swift file)
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)

        return cell
    }
    
        // MARK: - API Controller Protocol
    
    func didReciveAPIResults(name: NSDictionary)
    {
       
    }
     
}

