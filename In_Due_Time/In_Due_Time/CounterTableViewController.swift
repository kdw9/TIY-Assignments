//
//  CounterTableViewController.swift
//  In_Due_Time
//
//  Created by Keron Williams on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

@objc protocol DatePickerDelegate
{
    func dateWasChosen(date: String)
}

class CounterTableViewController: UITableViewController, UITextFieldDelegate, DatePickerDelegate
{
    var todoList = Array<TheList>()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    
    let checkImg = UIImage (contentsOfFile: "checkbutton.png")
    let unCheckImg = UIImage (contentsOfFile: "unchecked.png")
    var buttonIndex: NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
        
        let fetchRequest = NSFetchRequest(entityName: "TheList")
        do
        {
        let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [TheList]
        todoList = fetchResults!
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell", forIndexPath: indexPath) as! TodoCell
    

        // Configure the cell...

        let aListItem = todoList[indexPath.row]
        if aListItem.title == nil
        {
            cell.listTitleTextField.becomeFirstResponder()
            cell.checkButton.setImage(unCheckImg, forState: UIControlState.Normal)
            cell.listTitleTextField.text = ""
        }
        else
        {
            cell.listTitleTextField.text = aListItem.title; resignFirstResponder()
        }
        if aListItem.isDone
        {
            cell.checkButton.setImage(checkImg, forState: UIControlState.Normal)
            cell.backgroundColor = UIColor(red: 0.28, green: 0.20, blue: 0.52, alpha: 1)
            cell.listTitleTextField.textColor = UIColor.whiteColor()
        }
        else
        {
            cell.checkButton.setImage(unCheckImg, forState: UIControlState.Normal)
            cell.backgroundColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0)
            cell.listTitleTextField.textColor = UIColor.blackColor()
        }
            // I need to put a for in loop here to make the button work.
        
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: UITextField Delegate
    func dateWasChosen(date: String)
    {
        <#code#>
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if textField.text != ""
        {
            rc = true
            let contentView = textField.superview
            let cell = contentView?.superview as! TodoCell
            let indexPath = tableView.indexPathForCell(cell)
            let aListItem = todoList[indexPath!.row]
            aListItem.title = textField.text
            textField.resignFirstResponder()
            saveContext()
        }
        
        return rc
    }
    // MARK: - Action Handlers
    @IBAction func addToList(sender: UIBarButtonItem)
    {
        let aListItem = NSEntityDescription.insertNewObjectForEntityForName("TheList", inManagedObjectContext: managedObjectContext) as! TheList
          todoList.append(aListItem)
        tableView.reloadData()
    }
// MARK: - Private
    
    func saveContext()
    {
    do{
        try managedObjectContext.save()
        }
        catch{
        let nserror = error as NSError
        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
}

