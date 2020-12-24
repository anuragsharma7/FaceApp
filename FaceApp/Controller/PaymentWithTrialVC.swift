//
//  PaymentWithTrialVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit

class PaymentWithTrialVC: BaseClass {
    
//MARK:- Outlets
@IBOutlet weak var backBtnOutlet: UIButton!
@IBOutlet weak var unLockLabel: UILabel!
    
@IBOutlet weak var newLifeStartLabel: UILabel!
    
@IBOutlet weak var star1ImgView: UIImageView!
    
@IBOutlet weak var star2ImgView: UIImageView!
    
@IBOutlet weak var star3ImgView: UIImageView!
@IBOutlet weak var star4ImgView: UIImageView!
    
@IBOutlet weak var star5ImgView: UIImageView!
    
@IBOutlet weak var noInterruptionView: UIView!
@IBOutlet weak var customWorkOutView: UIView!
    
@IBOutlet weak var allExerciseView: UIView!
@IBOutlet weak var unlimitedUseView: UIView!
    
@IBOutlet weak var cancelAnyTimeView: UIView!
@IBOutlet weak var mainView: UIView!
    
@IBOutlet weak var trialImgView: UIImageView!
    
@IBOutlet weak var notCommitmentLabel: UILabel!
    
@IBOutlet weak var tryNowBtnOutlet: UIButton!
    
@IBOutlet weak var weeklyBtnOutlet: UIButton!
    
@IBOutlet weak var monthlyBtnOutlet: UIButton!
@IBOutlet weak var annualyBtnOutlet: UIButton!
    
@IBOutlet weak var lineLabel: UILabel!

@IBOutlet weak var restoreLabel: UILabel!
@IBOutlet weak var tAndCLabel: UILabel!
    
//MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//MARK:- IBActions
    
    
    @IBAction func backButton(_ sender: UIButton) {
    }
    
@IBAction func weeklyButton(_ sender: UIButton) {
    }
    
@IBAction func monthlyButton(_ sender: UIButton) {
    }
    
    
    @IBAction func annualyButton(_ sender: UIButton) {
    }
    
    @IBAction func tryNowButton(_ sender: UIButton) {
   
    
    }

    
}
