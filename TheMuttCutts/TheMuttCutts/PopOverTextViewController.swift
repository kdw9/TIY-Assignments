//
//  PopOverTextViewController.swift
//  TheMuttCutts
//
//  Created by Keron Williams on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class PopOverTextViewController: UIViewController
{
    var delegate = PopOverTextViewControllerProtocol!()
    
    
    @IBOutlet weak var cityFeild: UITextField!
    
    @IBOutlet weak var stateField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    //{
       // if segue.identifier == "ShowPopOverSegue"
        //{
           // let destVc = segue.destinationViewController as!
            //PopOverTextViewController
            //destVc .viewdestinationAnnotation =
            
       // }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   


