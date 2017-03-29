//
//  AppDelegate.swift
//  Blockstack
//
//  Created by Larry Salibra on 3/28/17.
//  Copyright © 2017 Blockstack. All rights reserved.
//

import UIKit
import Swifter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var count : Int = 0
    let server = HttpServer()
    var backgroundTaskId : UIBackgroundTaskIdentifier? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        server.listenAddressIPv4 = "127.0.0.1"
        server["/"] = { request in
            self.count = self.count + 1
            var response = "<h1>Hello Blockstack for the \(self.count)th time!</h1>"
            
            var applicationState : String? = nil
            switch UIApplication.shared.applicationState {
            case UIApplicationState.active:
                applicationState = "active"
            case UIApplicationState.background:
                applicationState = "background"
            case UIApplicationState.inactive:
                applicationState = "inactive"
            }
            
            var backgroundRefreshStatus : String? = nil
            switch UIApplication.shared.backgroundRefreshStatus {
            case UIBackgroundRefreshStatus.available:
                backgroundRefreshStatus = "available"
            case UIBackgroundRefreshStatus.denied:
                backgroundRefreshStatus = "denied"
            case UIBackgroundRefreshStatus.restricted:
                backgroundRefreshStatus = "restricted"
                
            }
            
            response = response + "<h2>Application state: \(applicationState!)</h2>"
            response = response + "<h2>Background time remaining: \(UIApplication.shared.backgroundTimeRemaining) seconds</h2>"
            response = response + "<h2>Background refresh status: \(backgroundRefreshStatus!)</h2>"
            return HttpResponse.ok(.html(response))
        }
        
        do {
            backgroundTaskId = UIApplication.shared.beginBackgroundTask(withName: "BlockstackCoreAPI", expirationHandler: {
                self.server.stop()
            })
            try server.start(8080, forceIPv4: true)
            NSLog("Server started: Operating: \(server.operating)")
            try NSLog("Listening: \(server.listenAddressIPv4!) Port: \(server.port())")
            
        } catch {
            NSLog("Server failed to start.")
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        NSLog("applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        NSLog("applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        NSLog("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        NSLog("applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        NSLog("applicationWillTerminate")
    }

}

