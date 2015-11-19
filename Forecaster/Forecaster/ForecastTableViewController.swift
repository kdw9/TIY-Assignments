//
//  ForecastTableViewController.swift
//  Forecaster
//
//  Created by Keron Williams on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

 protocol APIControllerProtocol
 {
    func didReceiveAPIResults (results:NSArray)
    func cityWasFound(aCity: City)
    
 }
protocol ModalViewControllerProtocol
{
    func zipCodeWasEntered(zipCode: String)


}


class ForecastTableViewController: UITableViewController, ModalViewControllerProtocol, APIControllerProtocol
{
        var api: APIController!
    var weatherCities = Array<City>()
    //var weather = Array<Weather>()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        api = APIController(delegate: self)
        
        //api.googleLocationApi("32712")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherCities.count
    }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("WeatherDataCell", forIndexPath: indexPath) as! WeatherLocationTableViewCell

        cell.numberDegreeLabel.text = "\(indexPath.row)"
        cell.weatherLocationLabel.text = "New York"
        cell.conditionLabel.text = "Sunny"
        cell.weathericon.image = UIImage(named: "SunnyIcon.png")
        return cell
   
    
    
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }
    
/////////////// This Block Out Code is to Create the deleteSwipe/////////
    ///// insert Array Name - {''''}/////
    
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool { return true}
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
//    {
//        if(editingStyle == UITableViewCellEditingStyle.Delete) {
//        ''''.removeAtIndex(indexPath.row)
//            self.tableView
//        }
        
            
            
            // Override to support conditional editing of the table view.
    //override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        //return true
    }



   
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // Override to support rearranging the table view.
   // override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {


    // Override to support conditional rearranging of the table view.
   // override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
   //     return true
   // }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ModalSegue"
        {
          let destVC = segue.destinationViewController as! UINavigationController
            let modal = destVC.viewControllers[0] as! ModalViewController
            modal.delegate = self
        }
    }

    // MARK: - ModalViewControllerProtocol 
    
    func zipCodeWasEntered(zipCode: String)
    {
     dismissViewControllerAnimated(true, completion: nil)
        print(zipCode)
        api.googleLocationAp(zipCode)
        
    
    }
    
    
        // MARK: - API Controller Protocol

        func didReceiveAPIResults (results:NSArray)
 {
    
 }
func cityWasFound(aCity: City)
{
weatherCities.append(aCity)
    
    tableView.reloadData()
}

}