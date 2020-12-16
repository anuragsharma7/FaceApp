//
//  Constants.swift
//  FaceApp
//
//  Created by Anurag Sharma on 16/12/20.
//

import Foundation
import UIKit

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

//font constants
extension UIFont {
  class var textStyle: UIFont {
    return UIFont(name: "AktivGroteskCorp-Bold", size: 40.0)!
  }
}
