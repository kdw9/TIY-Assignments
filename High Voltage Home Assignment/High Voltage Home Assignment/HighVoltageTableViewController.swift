//
//  HighVoltageTableViewController.swift
//  High Voltage Home Assignment
//
//  Created by Keron Williams on 10/25/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

// This protocol is for the class that is sending the data to the view that will make data appear in the table view
protocol FormulaListTableViewControllerDelegate
{
    func formulaWasChosen(chosenFormula: String)
}


class HighVoltageTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, FormulaListTableViewControllerDelegate
{
    var formulas = Array<OperatorBrain>()
    
    
    
    
    @IBOutlet weak var refresh: UIBarButtonItem!
    
    var remainingOperatorNames = ["Watts", "Volts", "Amps", "Ohms"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "High Voltage"

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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return formulas.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HighVoltageCell", forIndexPath: indexPath) 

        // Configure the cell...
        
        
        return cell
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // This code is to initialize the pop over segue
       if segue.identifier == "ShowFormulaListPopOverSegue"
       {
            let destVC = segue.destinationViewController as! FormulaListTableViewController
        // This Code is tell the destination View controller to asssign the array of strings in the remaingOperatorName to the propert in the formula list class
        destVC.electricFormulas = remainingOperatorNames
       
        // Now I am setting the  size of the pop over controller
        destVC.popoverPresentationController?.delegate = self
        destVC.delegate = self
        let contentHeight = 44.0 * CGFloat(remainingOperatorNames.count)
        destVC.preferredContentSize = CGSize(width: 200.0, height: contentHeight)
        
        }
        
    }
    // MARK: - UIPopoverPresentationController Delegate
    
    // This is tell the delegate to give me the style I want, I selected None
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    //MARL: - CharacterListTableViewController Delegate
    // This makes the pop over view controller dissappear
    func formulaWasChosen(chosenFormula: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        formulas.append(chosenFormula)
        
        let rowToRemove = (remainingOperatorNames as NSArray). indexOfObject(chosenFormula)
        remainingOperatorNames.removeAtIndex(rowToRemove)
        if remainingOperatorNames.count == 0
        {
            refresh.enabled = false
        }
        
        tableView?.reloadData()
        
        

    }
    
    

}
