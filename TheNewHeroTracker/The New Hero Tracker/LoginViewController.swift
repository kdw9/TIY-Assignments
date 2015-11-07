//
//  LoginViewController.swift
//  The New Hero Tracker
//
//  Created by Keron Williams on 11/4/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var userNameTextFeild: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
//    @IBOutlet weak var signInButton: UIButton!
//    
//    @IBOutlet weak var navBarCreateAccount: UIBarButtonItem!
//    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func userCanSignIn() ->Bool
    {
        if userNameTextFeild.text != "" && userPasswordTextField.text != ""
        {
            return true
        }
            return false
    }
    @IBAction func signInTapped(sender: UIButton)
    {
        if userCanSignIn()
        {
        PFUser.logInWithUsernameInBackground(userNameTextFeild.text!, password: userPasswordTextField.text!)
            {
                (user: PFUser?, error:NSError?) -> Void in
                
                if user !== nil
                {
                    print("login successful")
                    self.performSegueWithIdentifier("unwindFromLoginSegue", sender: self)
                }
                else
                {
                    print("error: "+(error?.localizedDescription)!)
                }
            }
        }
    }
}




























































