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
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view3: UIView!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Animation(customView: view1) { [self] (isTrue) in
            if isTrue {
                Animation(customView: view2) { (isTrue2) in
                    if isTrue2 {
                        print("2nd animation complete")
                    }
                }
                
            }
        }
        
//        Animation(customView: view3)
//        Animation(customView: view4)
//        Animation(customView: view5)
    }
    
    
    func Animation(customView: UIView, completionA: @escaping(_ isComplete: Bool) -> () )  {
//        // New animation
//
//        UIView.animate(withDuration: 30.0, delay: 0, options: [.repeat, .autoreverse], animations: {
//
//            customView.transform = CGAffineTransform(translationX: -customView.frame.width + self.view.bounds.width, y: 0)
//
//                    }, completion: nil)
        
        
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseInOut, animations: {

            customView.transform = CGAffineTransform(translationX: customView.bounds.origin.x + 300, y: customView.bounds.origin.y)

        }, completion: {_ in
            completionA(true)
        })

        customView.transform = .identity
        
    }
    
    
    //MARK:- IBActions
    
    @IBAction func continueButton(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(/*HomeVc*/TabBarVC.instance(), animated: true)
        }
        
    }
    @IBAction func crossButton(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(/*HomeVc*/TabBarVC.instance(), animated: true)
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
        
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

