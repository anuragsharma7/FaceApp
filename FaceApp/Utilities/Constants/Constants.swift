//
//  Constants.swift
//  FaceApp
//
//  Created by Anurag Sharma on 16/12/20.
//

import Foundation
import UIKit

let kMainStoryboard = UIStoryboard(name: "Main", bundle: nil)
let kVideoStoryboard = UIStoryboard(name: "Video", bundle: nil)


let kMain2Storyboard = UIStoryboard(name: "Main2", bundle: nil)

// MARK:- Device Sizes
let DEVICE_WIDTH = UIScreen.main.bounds.width
let DEVICE_HEIGHT = UIScreen.main.bounds.height
let SAFE_AREA = AppDelegate.shared.window?.safeAreaInsets ?? UIEdgeInsets.zero
let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone


let AppName: String = {
        if let infoDict = Bundle.main.infoDictionary, let value = infoDict["CFBundleDisplayName"] as? String {
            return value
        }
        return ""
    }()



struct userDefaultKeys {
    static let objectiveArr = "objectiveArr"
}

//not using below code for now//

//color constants
extension UIColor {
    
    @nonobjc class var ceruleanBlue: UIColor {
        return UIColor(red: 7.0 / 255.0, green: 107.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var azul: UIColor {
        return UIColor(red: 45.0 / 255.0, green: 127.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    }
}

struct userDefaultKey {
    static let dayArr = "dayArr"
}

//font constants
extension UIFont {
    class var textStyle: UIFont {
        return UIFont(name: "AktivGroteskCorp-Bold", size: 40.0)!
    }
}
 
