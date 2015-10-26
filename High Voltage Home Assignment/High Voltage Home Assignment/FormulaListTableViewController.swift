//
//  FormulaListTableViewController.swift
//  High Voltage Home Assignment
//
//  Created by Keron Williams on 10/25/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


class FormulaListTableViewController: UITableViewController
{
    var electricFormulas: [String]?
    var delegate: FormulaListTableViewControllerDelegate?
    
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return electricFormulas!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FormulaCell", forIndexPath: indexPath)

        // Configure the cell...
        
        let aFormula = electricFormulas?[indexPath.row]
        cell.textLabel?.text = aFormula
        
        return cell
    }
  // This code makes you select the row at the index path
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
// This code make you automatically deselect the highlighted row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.formulaWasChosen((electricFormulas?[indexPath.row])!)
// The code above is saying take the fomula that the use picked and send it back to the delegate
    }
    
}
