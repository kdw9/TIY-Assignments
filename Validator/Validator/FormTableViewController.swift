//
//  FormTableViewController.swift
//  Validator
//
//  Created by Keron Williams on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class FormTableViewController: UITableViewController, UITextFieldDelegate
{

    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var addressTextFeild: UITextField!
    @IBOutlet weak var cityTextFeild: UITextField!
    @IBOutlet weak var stateTextFeild: UITextField!
    @IBOutlet weak var zipCodeTextFeild: UITextField!
    @IBOutlet weak var phoneNumberTextFeild: UITextField!
    
    let validator = Validator()
    
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
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        switch textField
        {
        case nameTextFeild:
            if validator.validateName(textField.text!)
            {
                addressTextFeild.becomeFirstResponder()
            }
        case addressTextFeild:
            if validator.validateAddress(textField.text!)
            {
                cityTextFeild.becomeFirstResponder()
            }
        case cityTextFeild:
            if validator.validateCity(textField.text!)
            {
                stateTextFeild.becomeFirstResponder()
            }
        case stateTextFeild:
            if validator.validateState(textField.text!)
            {
                zipCodeTextFeild.becomeFirstResponder()
            }
        case zipCodeTextFeild:
            if validator.validateZipCode(textField.text!)
            {
                phoneNumberTextFeild.becomeFirstResponder()
            }
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
  
}
