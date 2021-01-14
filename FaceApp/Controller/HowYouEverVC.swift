//
//  HowYouEverVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class HowYouEverVC: BaseClass {
    
    enum Objective: NSNumber {
        case regular
        case tried
        case never
        
    }
    
    
    //MARK:- Variables
    var objectiveArr = [Objective]()
      
    var selectedButtonArr = [0,0,0]
    
    
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
        
        switch sender.tag {
        case 0:
            selectedButtonArr[sender.tag] = 0
                        // UserDefaults.standard.set(sender.tag, forKey: "Regular")
                        if regularBtn.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
            //                selectedButtonArr[sender.tag] = 0
                            regularBtn.backgroundColor = .black
                        }
                        else {
                            selectedButtonArr[sender.tag] = 1
                            regularBtn.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
                        }
                        break
            //updateBtnAndSaveData(with: regularBtn, sender: sender)
        case 1:
            selectedButtonArr[sender.tag] = 0
                        // UserDefaults.standard.set(sender.tag, forKey: "Regular")
                        if triedBtn.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
            //                selectedButtonArr[sender.tag] = 0
                            triedBtn.backgroundColor = .black
                        }
                        else {
                            selectedButtonArr[sender.tag] = 1
                            triedBtn.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
                        }
                        break
            //updateBtnAndSaveData(with: triedBtn, sender: sender)
        case 2:
            selectedButtonArr[sender.tag] = 0
                        // UserDefaults.standard.set(sender.tag, forKey: "Regular")
                        if neverBtn.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
            //                selectedButtonArr[sender.tag] = 0
                            neverBtn.backgroundColor = .black
                        }
                        else {
                            selectedButtonArr[sender.tag] = 1
                            neverBtn.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
                        }
                        break
            //updateBtnAndSaveData(with: neverBtn, sender: sender)
        default: break
        }
        print(selectedButtonArr)
        
        //userdefault
        UserDefaults.standard.set(selectedButtonArr, forKey: userDefaultKeys.objectiveArr)
       
       if let val = UserDefaults.standard.value(forKey: userDefaultKeys.objectiveArr) {
           print(val)
       }
        
        push()
    }
    
    func updateBtnAndSaveData(with btn: UIButton, sender: UIButton) {
        btn.isHidden = !btn.isHidden
        selectedButtonArr[sender.tag] =  !btn.isHidden ? 1 : 0
    
    
}
}
