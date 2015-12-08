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
    @IBOutlet weak var errorLabel: UILabel!
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "DatePickerSegue"
        {
            let pickerVC = segue.destinationViewController as!DatePickerViewController
            pickerVC.delegate = self
        }
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
        
        if aListItem.date != nil
        {
          cell.dateButton.setTitle("Due By:" + aListItem.date!, forState: UIControlState.Normal)
        }
        
        
        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        let aListItem = todoList[indexPath.row]
        
        if aListItem.isDone
        {
            let todoItem = todoList[indexPath.row]
            
        if editingStyle == .Delete
        {
            todoList.removeAtIndex(indexPath.row)
            managedObjectContext.deleteObject(todoItem)
        
        }
            
           saveContext()
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
        else
        {
            errorLabel.text = "Check tasks befor you delete them!"
        }
            
    }
    

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
        todoList[buttonIndex.row].date = date
        
        tableView.reloadData()
        saveContext()
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
    
    @IBAction func dateButtonPressed(sender: UIButton)
    {
        let contentView = sender.superview
        let cell = contentView?.superview as! TodoCell
        buttonIndex = tableView.indexPathForCell(cell)!
    }
    
    @IBAction func checkboxPressed(sender: UIButton)
    {
        let contentView = sender.superview
        let cell = contentView?.superview as! TodoCell
        let indexPath = tableView.indexPathForCell(cell)
        let todoItem = todoList[indexPath!.row]
        
        aListItem.title = cell.titleTextField.text //just in case they don't press enter when they're typing in their todo and just immediately check it off
        
        if sender.currentImage == unCheckImg
        {
            cell.checkButton.setImage(checkImg, forState: UIControlState.Normal)
            aListItem.isDone = true
            //            cell.backgroundColor = UIColor.lightTextColor()
            cell.backgroundColor = UIColor(red:0.38, green:0.00, blue:0.02, alpha:1.0)
            cell.listTitleTextField.textColor = UIColor.whiteColor()
        }
        else
        {
            cell.checkButton.setImage(unCheckImg, forState: UIControlState.Normal)
            aListItem.isDone = false
            cell.backgroundColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0)
            cell.listTitleTextField.textColor = UIColor.greenColor()
        }
        
        tableView.reloadData()
        saveContext()
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

