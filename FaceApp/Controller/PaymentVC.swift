//
//  PaymentVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 18/12/20.
//

import UIKit

class PaymentVC: BaseClass {
    
    //MARK:-Variables
    //    var timer = Timer()
    //    var counter = 0
    
    
    //MARK:-
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var personilizedLabel: UILabel!
    @IBOutlet weak var star1ImgView: UIImageView!
    @IBOutlet weak var star2ImgView: UIImageView!
    @IBOutlet weak var star3ImgView: UIImageView!
    @IBOutlet weak var star4ImgView: UIImageView!
    @IBOutlet weak var star5ImgView: UIImageView!
    
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var customWorkOutLabel: UILabel!
    
    @IBOutlet weak var allExerciseLabel: UILabel!
    @IBOutlet weak var unlimitedLabel: UILabel!
    @IBOutlet weak var cancelLabel: UILabel!
    
    @IBOutlet weak var firstCheckImgView: UIImageView!
    
    @IBOutlet weak var secondCheckImgView: UIImageView!
    
    @IBOutlet weak var thirdCheckImgView: UIImageView!
    @IBOutlet weak var forthCheckImgView: UIImageView!
    
    @IBOutlet weak var fifthImgView: UIImageView!
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var freeTrialLabel: UILabel!
    @IBOutlet weak var restoreLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*day3Label.blink()
         customWorkOutLabel.blink()
         allExerciseLabel.blink()
         unlimitedLabel.blink()
         cancelLabel.blink()*/
         
    }
    
    
    //MARK:- IBActions
    
    @IBAction func continueButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeVc.instance(), animated: true)
    }
    
    //MARK:- Methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Extension
extension UILabel {
    func blink() {
        self.alpha = 0.2
        UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {self.alpha = 1.0}, completion: nil)
    }
}

