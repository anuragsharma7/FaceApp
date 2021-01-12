//
//  WorkOutVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 25/12/20.
//

import UIKit

class WorkOutVC: BaseClass {

    @IBOutlet weak var wantMoreBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wantMoreBtn.isHidden = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueBtn(_ sender: UIButton) {
        self.navigationController?.pushViewController(TakeAPhotoVC.instance(), animated: true)
    }
    
    @IBAction func wantMoreBtn(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(PaymentWithTrialVC.instance(), animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
