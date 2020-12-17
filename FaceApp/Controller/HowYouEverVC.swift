//
//  HowYouEverVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class HowYouEverVC: UIViewController {

//MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
//MARK:- Outlets
@IBOutlet weak var slider1Label: UILabel!
@IBOutlet weak var slider2Label: UILabel!
@IBOutlet weak var slider3Label: UILabel!
@IBOutlet weak var regularBtn: UIButton!
@IBOutlet weak var triedBtn: UIButton!
    
@IBOutlet weak var neverBtn: UIButton!
    
    
    
//MARK:- IBAction
    
@IBAction func regularButton(_ sender: UIButton) {
    }
    
@IBAction func triedLongTimeAgoButton(_ sender: UIButton) {
    }
    
    @IBAction func neverButton(_ sender: UIButton) {
    }
}
