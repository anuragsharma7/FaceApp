//
//  ScheduleVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class ScheduleVC: BaseClass {
    
    enum Days: NSNumber {
        case monday
        case tuesday
        case wednesday
        case thrusday
        case friday
        case saturday
        case sunday
    }
    
    var dayArr = [Days]()
    
    var selectedDaysArr = [0,0,0,0,0,0,0] //M,T,W...
    
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
        day1View.backgroundColor = .black
        day1View.layer.borderWidth = 2
        day1View.layer.borderColor = UIColor.white.cgColor
        day2View.backgroundColor = .black
        day2View.layer.borderWidth = 2
        day2View.layer.borderColor = UIColor.white.cgColor
        day3View.backgroundColor = .black
        day3View.layer.borderWidth = 2
        day3View.layer.borderColor = UIColor.white.cgColor
        day4View.backgroundColor = .black
        day4View.layer.borderWidth = 2
        day4View.layer.borderColor = UIColor.white.cgColor
        day5View.backgroundColor = .black
        day5View.layer.borderWidth = 2
        day5View.layer.borderColor = UIColor.white.cgColor
        day6View.backgroundColor = .black
        day6View.layer.borderWidth = 2
        day6View.layer.borderColor = UIColor.white.cgColor
        day7View.backgroundColor = .black
        day7View.layer.borderWidth = 2
        day7View.layer.borderColor = UIColor.white.cgColor
    }
    
    //MARK:- Methods
    
    
    //MARK:- IBAction
    
    @IBAction func daysButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            selectedDaysArr[sender.tag] = 0
            // UserDefaults.standard.set(sender.tag, forKey: "Monday")
            if day1View.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
                //                selectedDaysArr[sender.tag] = 0
                day1View.backgroundColor = .black
            }
            else {
                selectedDaysArr[sender.tag] = 1
                day1View.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
            }
            break
        case 1:
            // UserDefaults.standard.set(sender.tag, forKey: "Tuesday")
            if day2View.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
                selectedDaysArr[sender.tag] = 0
                day2View.backgroundColor = .black
            }
            else{
                selectedDaysArr[sender.tag] = 1
                day2View.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
            }
            break
        case 2:
            // UserDefaults.standard.set(sender.tag, forKey: "Wednesday")
            if day3View.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
                selectedDaysArr[sender.tag] = 0
                day3View.backgroundColor = .black
            }
            else{
                selectedDaysArr[sender.tag] = 1
                day3View.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
            }
            break
        case 3:
            // UserDefaults.standard.set(sender.tag, forKey: "Thursday")
            if day4View.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
                selectedDaysArr[sender.tag] = 0
                day4View.backgroundColor = .black
            }
            else{
                selectedDaysArr[sender.tag] = 1
                day4View.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
            }
            break
        case 4:
            // UserDefaults.standard.set(sender.tag, forKey: "Friday")
            if day5View.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
                selectedDaysArr[sender.tag] = 0
                day5View.backgroundColor = .black
            }
            else{
                selectedDaysArr[sender.tag] = 1
                day5View.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
            }
            break
        case 5:
            // UserDefaults.standard.set(sender.tag, forKey: "Saturday")
            if day6View.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
                selectedDaysArr[sender.tag] = 0
                day6View.backgroundColor = .black
            }
            else{
                selectedDaysArr[sender.tag] = 1
                day6View.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
            }
            break
        case 6:
            // UserDefaults.standard.set(sender.tag, forKey: "Sunday")
            if day7View.backgroundColor == UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)  {
                selectedDaysArr[sender.tag] = 0
                day7View.backgroundColor = .black
            }
            else{
                selectedDaysArr[sender.tag] = 1
                day7View.backgroundColor = UIColor(red: 45/255, green: 127/255, blue: 240/255, alpha: 1.0)
            }
            break
        default:
            
            break
        }
        UserDefaults.standard.setValue(selectedDaysArr, forKey: "SelectedDays")
        let val =  UserDefaults.standard.value(forKey: "SelectedDays") != nil
        print(val)
        
    }
    
    
    
    @IBAction func continueButton(_ sender: UIButton) {
        let consistVC = ConsistencyVC.instance()
        self.navigationController?.pushViewController(consistVC, animated: true)
    }
    
    
}
