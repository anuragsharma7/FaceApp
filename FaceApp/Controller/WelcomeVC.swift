//
//  WelcomeVC.swift
//  FaceApp
//
//  Created by Anurag Sharma on 16/12/20.
//

import UIKit
import Purchases

class WelcomeVC: BaseClass {
    
    //MARK:- Outlets
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var facerefLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    //@IBOutlet weak var alphaFaceLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    //  MARK:-IBAction
    @IBAction func startButton(_ sender: UIButton) {
        //Push to ObjectiveVC
        self.navigationController?.pushViewController(ObjectiveVC.instance(), animated: true)
    }
}
