//
//  HomeCollectionReusableView.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit

class HomeCollectionReusableView: UICollectionReusableView {
    static let identifier = "HomeCollectionReusableViewID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func view() -> UICollectionReusableView {
        let v = UICollectionReusableView.fromNib() as! UICollectionReusableView
        return v
    }
    
}
