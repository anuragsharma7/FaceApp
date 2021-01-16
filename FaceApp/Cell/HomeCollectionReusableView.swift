//
//  HomeCollectionReusableView.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit

class HomeCollectionReusableView: UICollectionReusableView {
    //Divya
    static let identifier = "HomeCollectionReusablesID"
    
    
    //MARK:- IBoutlets
    
    @IBOutlet weak var startWorkoutBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
//MARK:- IBAction
    
    @IBAction func startWorkoutButton(_ sender: UIButton) {
        

    }
    
    class func view() -> UICollectionReusableView {
        let v = UICollectionReusableView.fromNib() as! UICollectionReusableView
        return v
    }
    
}
