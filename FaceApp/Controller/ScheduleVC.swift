//
//  ScheduleVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class ScheduleVC: BaseClass {
    
    //MARK:- Outlets
    
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    
    @IBOutlet weak var day1View: UIView!
    @IBOutlet weak var day2View: UIView!
    @IBOutlet weak var day3View: UIView!
    @IBOutlet weak var day4View: UIView!
    @IBOutlet weak var day5View: UIView!
    @IBOutlet weak var day6View: UIView!
    @IBOutlet weak var day7View: UIView!
    
    @IBOutlet weak var day1Label: UILabel!
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var day4Label: UILabel!
    @IBOutlet weak var day5Label: UILabel!
    @IBOutlet weak var day6Label: UILabel!
    @IBOutlet weak var day7Label: UILabel!
    
    @IBOutlet weak var day1Btn: UIButton!
    @IBOutlet weak var day2Btn: UIButton!
    @IBOutlet weak var day3Btn: UIButton!
    @IBOutlet weak var day4Btn: UIButton!
    @IBOutlet weak var day5Btn: UIButton!
    @IBOutlet weak var day6Btn: UIButton!
    @IBOutlet weak var day7Btn: UIButton!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Methods
     
    
    //MARK:- IBAction
    
    @IBAction func day1Button(_ sender: UIButton) {
    }
    @IBAction func day2Button(_ sender: UIButton) {
    }
    @IBAction func day3Button(_ sender: UIButton) {
    }
    @IBAction func day4Button(_ sender: UIButton) {
    }
    @IBAction func day5Button(_ sender: UIButton) {
    }
    
    @IBAction func day6Button(_ sender: UIButton) {
    }
    
    @IBAction func day7Button(_ sender: UIButton) {
    }
   
    
    @IBAction func continueButton(_ sender: UIButton) {
        let consistVC = ConsistencyVC.instance()
        self.navigationController?.pushViewController(consistVC, animated: true)
    }
    
}
