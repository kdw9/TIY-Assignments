//
//  ViewController.swift
//  Countdown
//
//  Created by Keron Williams on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol TimeerPickerDelegate

{
    func timerWasChosen(timerCount: Int)
    
}

class CountDownViewController: UIViewController, TimeerPickerDelegate
{

    @IBOutlet weak var countDown: UILabel!
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
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowCountdownPickerSegue"
        {
            let timerPickerVC = segue.destinationViewController as! TimerPickerViewController timerPickerVC.delegate = self
        }
    }
    
    
    // MARK: -TimerPicker Delegate
    func timerWasChosen(timerCount: Int)
    {
        <#code#>
    }
}

