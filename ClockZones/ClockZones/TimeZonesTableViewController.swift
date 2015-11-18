//
//  TimeZonesTableViewController.swift
//  ClockZones
//
//  Created by Keron Williams on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import Foundation

protocol TimeTableViewControllerDelegate
{
    func timeZoneWasChosen(chosenTimeZone: String)
}

class TimeZonesTableViewController: UITableViewController, UIPopoverControllerDelegate, TimeTableViewControllerDelegate
{

    @IBOutlet weak var populateButton: UIBarButtonItem!
    
    
    var userSelectedTimes = [String]()
    var allTimeZone = NSTimeZone.knownTimeZoneNames()
    var remainingTimeZone = NSTimeZone.knownTimeZoneNames()
    
    
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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return userSelectedTimes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timerZoneCell", forIndexPath: indexPath) as! TheTimeZoneTableViewCell

        // Configure the cell...
        
        let timeZoneSelected = userSelectedTimes[indexPath.row]
        cell.timeZoneLabel.text = timeZoneSelected
        cell.clockView.timezone = NSTimeZone(name: timeZoneSelected)
        
        
        return cell
    }
   

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowTimeZoneSegue"
        {
            let destinationVC = segue.destinationViewController as!TimeTableViewController
            destinationVC.timeZone = remainingTimeZone
            destinationVC.delegate = self
        }
        
        
    }

    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
    return.None
    
    }
    
    //picking from the table and dismissing it
    func timeZoneWasChosen(chosenTimeZone: String)
    {
    navigationController?.dismissViewControllerAnimated(true, completion: nil)
        userSelectedTimes.append(chosenTimeZone)
        
        let rowToRemove = (remainingTimeZone as NSArray).indexOfObject(chosenTimeZone);remainingTimeZone.removeAtIndex(rowToRemove)
        if remainingTimeZone.count == 0
        {
         populateButton.enabled = false
        }
        
        tableView?.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
