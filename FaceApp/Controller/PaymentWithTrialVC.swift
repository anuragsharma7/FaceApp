//
//  PaymentWithTrialVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit

class PaymentWithTrialVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    class func instance() -> PaymentWithTrialVC {
              let className = String(describing: self)
              return kMainStoryboard.instantiateViewController(withIdentifier: className) as! PaymentWithTrialVC
          }

}
