//
//  TimeTableViewController.swift
//  ClockZones
//
//  Created by Keron Williams on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TimeTableViewController: UITableViewController
{

    var timeZone: [String]?
    var delegate: TimeTableViewControllerDelegate?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return timeZone!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("locationZoneCell", forIndexPath: indexPath)

        // Configure the cell...
        let timeLocator = timeZone?[indexPath.row]
        cell.textLabel?.text = timeLocator
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.timeZoneWasChosen((timeZone?[indexPath.row])!)
    }
    
    
    }
  


