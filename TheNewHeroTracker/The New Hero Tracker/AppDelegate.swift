//
//  AppDelegate.swift
//  The New Hero Tracker
//
//  Created by Keron Williams on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
 //  PFOject
//        Parse.setApplicationId("tYdqZBRpIt4P4V3U2uzMdbEMA9fnV7JUvHurNR3d",
//            clientKey: "cP96apkpWgI8tqLHMu8u9Bk87Z5wa6uWcpNAicjY")
       
//        let hero = PFObject(className: "Hero")
//        hero["name"] = "Thor"
//        hero["power"] = 500
//        hero.saveInBackgroundWithBlock
//        {
//            (success: Bool, error: NSError?) -> Void in
//            if success
//            {
//                print("Thunder")
//            }
//            else
//            {
//                print(error?.localizedDescription)
//            }
//        }
        
//        let query = PFQuery(className: "Hero")
//        query.whereKey("power", greaterThan: 400)
//        query.findObjectsInBackgroundWithBlock
//        {
//            (results: [PFObject]?, error: NSError?) -> Void in
//            if error == nil
//            {
//                print(results)
//            }
//            else
//            {
//                print(error?.localizedDescription)
//            }
//        }
//        return true
//    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

  return true
 }

}