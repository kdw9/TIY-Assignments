//
//  HeroDetailViewController.swift
//  The New Hero Tracker
//
//  Created by Keron Williams on 10/24/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


class HeroDetailViewController: UIViewController
{
    // What Im doing right here is storing an Individual Thow
    // This is creating a handle for this current detail view controller
    var eachHero: Hero?
    
    
    // Controll and Drag to connect the IBOutlets into the detail view controller
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroPicCenterAlign: NSLayoutConstraint!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var heroPicture: UIImageView!
  
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      // I am taking the labels and linking it to my hero Object info
        
        nameLabel.text = eachHero?.name
        homeworldLabel.text = eachHero?.homeworld
        powerLabel.text = eachHero?.powers
         //heroPortrait.image = UIImage(named: hero!.portrait)
        heroPicture.image = UIImage(named: (eachHero?.heroImage)!)
        
        func viewWillAppear(animated: Bool)
        {
            super.viewWillAppear(animated)
            heroPicCenterAlign.constant -= view.bounds.width
        }
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        
        func viewDidAppear(animated: Bool)
        {
            super.viewDidAppear(animated)
            
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations:
                {
                self.heroPicCenterAlign.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                }, completion: nil)
            
        }
    }
}
