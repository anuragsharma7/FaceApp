//
//  ButtonExtensions.swift
//  FaceApp
//
//  Created by Anurag Sharma on 16/12/20.
//

import Foundation
import UIKit

extension UIButton {
    
    func makeRound(by num: Int) {
        layer.cornerRadius = CGFloat(num)
    }
    
    func makeBorder(by num: Int){
        layer.borderWidth = 2
        //layer.borderColor = 
    }
}


