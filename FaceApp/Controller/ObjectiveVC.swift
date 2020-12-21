//
//  ObjectiveVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class ObjectiveVC: BaseClass {
    
    //MARK:- Outlets
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var slider3Label: UILabel!
    
    @IBOutlet weak var chooseYrObjLabel: UILabel!
    
    @IBOutlet weak var selectMultipleLabel: UILabel!
    
    @IBOutlet weak var jawlineImgView: UIImageView!
    
    @IBOutlet weak var hairLossImgView: UIImageView!
    
    @IBOutlet weak var dandruffsImgView: UIImageView!
    
    @IBOutlet weak var wrinklesImgView: UIImageView!
    
    
    @IBOutlet weak var continueBtn: UIButton!
    
    
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    //MARK:- IBAction
    
    @IBAction func continueButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(AgeVC.instance(), animated: true)
    }
}
