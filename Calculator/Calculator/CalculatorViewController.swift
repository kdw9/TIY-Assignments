//
//  ViewController.swift
//  Calculator
//
//  Created by Keron Williams on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{
//    @IBOutlet var displayScreen: UILabel!
    @IBOutlet var display: UILabel!
    
    var brain = CalculatorBrain()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(sender: UIButton)
    {
        display.text = "0"
        brain = CalculatorBrain()
    }

    @IBAction func number(sender: UIButton)
    {
        display.text = brain.addDigit(sender.currentTitle!)
    }
    
    @IBAction func operators(sender: UIButton)
    {
    
    }

        
}
    
    
  
    
 



