//
//  HeaderCollectionReusableView.swift
//  FaceApp
//
//  Created by Divya Pathak on 22/12/20.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableViewID"
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func view1() -> UICollectionReusableView {
        let v = UICollectionReusableView.fromNib() as! UICollectionReusableView
        return v
    }
    
}
