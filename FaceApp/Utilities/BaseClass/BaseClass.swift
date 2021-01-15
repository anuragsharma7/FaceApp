//
//  BaseClass.swift
//  FaceApp
//
//  Created by Anurag Sharma on 21/12/20.
//

import Foundation
import UIKit

class BaseClass: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableDarkModeReflection()
    }
    
    /// Creates an instance of its child class. The identifier of ViewCotroller in storyboard should be same as name of the class.
    ///
    /// - Returns: an instance of referenced class.
    class func instance() -> UIViewController {
        let className = String(describing: self)
        return kMainStoryboard.instantiateViewController(withIdentifier: className)
    }
    
    class func instance2() -> UIViewController {
        let className = String(describing: self)
        return kVideoStoryboard.instantiateViewController(withIdentifier: className)
    }
    
    /// Will disable the effect of darm mode and our app will always run in light mode.
    func disableDarkModeReflection() {
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
    }
}
 
