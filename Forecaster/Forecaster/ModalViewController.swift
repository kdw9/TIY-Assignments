//
//  ViewController.swift
//  Forecaster
//
//  Created by Keron Williams on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var zipCodeInput: UITextField!
    @IBOutlet weak var connection: UIButton!
   
    
    var delegate: ModalViewControllerProtocol?
    
    override func viewDidLoad()
    
    
    {
        super.viewDidLoad()
        
       // zipCodeInput.becomeFirstResponder()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {

        if zipCodeInput != ""
        {
            zipCodeInput.text = textField.text
            textField.resignFirstResponder()
            return true
        }
        else
        {
            return false
        }

        
    }


    @IBAction func seachButtonPressed(sender: UIButton)
    {
     if zipCodeInput.text != ""
     {
        print("work")
       delegate?.zipCodeWasEntered(zipCodeInput.text!)
     }
    }











}

