//
//  TakeAPhotoVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit

class TakeAPhotoVC: BaseClass {
    
//MARK:- Outlets
@IBOutlet weak var progressImgView: UIImageView!
    
@IBOutlet weak var trackProgressLabel: UILabel!
    
    
@IBOutlet weak var backBtnOutlet: UIButton!
    
@IBOutlet weak var todayBtnOutlet: UIButton!
    
    
    @IBOutlet weak var nextWorkOutBtnOutlet: UIButton!
    
    
    @IBOutlet weak var takeApictureBtnOutlet: UIButton!
    
    
    @IBOutlet weak var noThanksBtnOutlet: UIButton!
    
    
    
//MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//MARK:- IBActions
    
    @IBAction func backButton(_ sender: UIButton) {
    }
    
    @IBAction func todayButton(_ sender: UIButton) {
    }
    
    
    @IBAction func nextWorkOutButton(_ sender: UIButton) {
    }
  
    
    @IBAction func takePictureButton(_ sender: UIButton) {
    }
    
    
    @IBAction func noThanksButton(_ sender: UIButton) {
    }
    
}
