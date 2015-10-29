//
//  CharacterListTableViewController.swift
//  Collect-Em-All
//
//  Created by Keron Williams on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CharacterListTableViewController: UITableViewController
{

    var characters: [String]?
    
    var delegate: CharacterListTableViewControllerDelegate?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

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
        
        return characters!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CharacterCell", forIndexPath: indexPath)

        // Configure the cell...
        let aCharacter = characters?[indexPath.row]
        cell.textLabel?.text = aCharacter
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.characterWasChosen((characters?[indexPath.row])!)
    }

}
