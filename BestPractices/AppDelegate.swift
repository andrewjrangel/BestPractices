//
//  AppDelegate.swift
//  BestPractices
//
//  Created by Andrew Rangel on 10/11/18.
//  Copyright © 2018 Antifragile Development. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // One thing I have noticed is apps that have spinners fail to quit them if this method triggers leaving the user in a locked state
        // Ofter overlooked this method is vital to consider because viewWillAppear is not called when the app comes back
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // This is the method you will have to consider if you want to restore state for the user after coming back to the app
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

