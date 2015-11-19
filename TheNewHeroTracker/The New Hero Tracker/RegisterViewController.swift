//
//  RegisterViewController.swift
//  The New Hero Tracker
//
//  Created by Keron Williams on 11/4/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
//
//import UIKit
//
//class RegisterViewController: UIViewController
//{
//    @IBOutlet weak var emailTextField: UITextField!
//
//    @IBOutlet weak var emailPassword: UITextField!
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    func theUserCanRegister() -> Bool
//    {
//        if emailTextField.text != "" && emailPassword.text != ""
//        {
//            return true
//        }
//            return false
//    }
//    
//    @IBAction func createAccountTapped(sender: UIButton)
//    {
//        if theUserCanRegister()
//        {
//            let user = PFUser()
//            user.username = emailTextField.text!
//            user.username = emailPassword.text!
//            
//            user.saveInBackgroundWithBlock
//            {
//                (succeded: Bool, error: NSError?) -> Void in
//                if  succeded
//                {
//                    print("register successful!")
//                }
//                    else
//                {
//                    print("error: "+(error?.localizedDescription)!)
//                }
//            }
//        }
//    }
//    
//}
