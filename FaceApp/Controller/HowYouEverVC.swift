//
//  HowYouEverVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class HowYouEverVC: BaseClass {
    
    //MARK:- Outlets
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var slider3Label: UILabel!
    @IBOutlet weak var regularBtn: UIButton!
    @IBOutlet weak var triedBtn: UIButton!
    
    @IBOutlet weak var neverBtn: UIButton!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Methods
    
    func push() {
        self.navigationController?.pushViewController(ScheduleVC.instance(), animated: true)
    }
 
    //MARK:- IBAction
    
    @IBAction func regularButton(_ sender: UIButton) {
        push()
    }
    
    @IBAction func triedLongTimeAgoButton(_ sender: UIButton) {
        push()
    }
    
    @IBAction func neverButton(_ sender: UIButton) {
        push()
    }
  
}
