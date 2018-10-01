// For App Store
//  AppDelegate.swift
//  Poetry
//
//  Created by MacBook on 02.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    //    lazy var coreDataStack = CoreDataStack() коммент тк удалил CoreData Stack
    
    // тут будем менят цвет Navigation Controller и Status & Tap Bars
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9830823541, green: 0.8759781718, blue: 0.9753966928, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.7103965878, green: 0.3734310269, blue: 0.8125683665, alpha: 1)        //цвет текста
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.672329545, green: 0.4029557109, blue: 0.7608545423, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.9830823541, green: 0.8759781718, blue: 0.9753966928, alpha: 1)
        UITabBar.appearance().selectionIndicatorImage = UIImage(named: "tabSelectBG")
        
        
        
        let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))
        statusBarView.backgroundColor = #colorLiteral(red: 0.9830823541, green: 0.8759781718, blue: 0.9753966928, alpha: 1)
        self.window?.rootViewController?.view.insertSubview(statusBarView, at: 0)
        
        if let barFont = UIFont(name: "AppleSDGothicNeo-Light", size: 24) {
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: barFont]
        }
        
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        //        self.coreDataStack.saveContext()  коммент тк удалил CoreData
    }
    
    
}

