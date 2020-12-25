//
//  CommonMethods.swift
//  FaceApp
//
//  Created by Anurag Sharma on 21/12/20.
//

import Foundation
import UIKit

class CommonMethods {
    
    ///Sets the root VC of the App
    class func setRootViewController() {
        let VC = StepAndBenefitsVC.instance()
        let navVC = UINavigationController(rootViewController: VC)
        navVC.isNavigationBarHidden = true
        navVC.view.frame = CGRect(x: 0, y: 0, width: DEVICE_WIDTH, height: DEVICE_HEIGHT)
        navVC.view.layoutIfNeeded()
        
        #warning("need to set the smooth windows transition animation")
        
        AppDelegate.shared.window?.rootViewController = navVC
        AppDelegate.shared.window?.makeKeyAndVisible()
    }
    
}
