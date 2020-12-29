//
//  AppDelegate.swift
//  FaceApp
//
//  Created by Anurag Sharma on 16/12/20.
//

import UIKit
import Firebase
import Purchases

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    /*
     The AppDelegate will be responsible for the application lifecycle and setup only. 
     */
    
    //let storyboard = UIStoryboard(name: "Main2", bundle: nil)
    var window: UIWindow?
    
    //Shared instance
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "DlMEErkTzctDTLZxZRrVMBNAiuVpCmXQ")
        
        CommonMethods.setRootViewController()
        
        UNUserNotificationCenter.current().delegate = self
        FirebaseApp.configure()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    //Notifications functions here...
    
}
