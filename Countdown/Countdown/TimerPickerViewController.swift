//
//  TimerPickerViewController.swift
//  Countdown
//
//  Created by Keron Williams on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TimerPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet var picker: UIPickerView!
    var delegate: TimerPickerDelegate?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated) delgate?.timerWas
    }
    
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 60
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(row+1)"
    }
}
