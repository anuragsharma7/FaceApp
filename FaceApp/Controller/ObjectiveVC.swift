//
//  ObjectiveVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit
import Purchases

//import FirebaseFirestore

class ObjectiveVC: BaseClass {
    
    enum Objective: NSNumber {
        case jawlin
        case dandruffs
        case hairLoss
        case wrinkles
    }
    
    //MARK:- Variables
    
    
    var objectiveArr = [Objective]()
    
    var selectedBtnArr = [0,0,0,0]
    
    
    //private var thoughtsCollectionRef: CollectionReference!
    //private var Users = [User]()
    //private var db = Firestore.firestore()
    
    //MARK:- Outlets
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var slider3Label: UILabel!
    @IBOutlet weak var chooseYrObjLabel: UILabel!
    @IBOutlet weak var selectMultipleLabel: UILabel!
    @IBOutlet weak var jawlineImgView: UIImageView!
    @IBOutlet weak var hairLossImgView: UIImageView!
    @IBOutlet weak var dandruffsImgView: UIImageView!
    @IBOutlet weak var wrinklesImgView: UIImageView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var jawlinBtn: UIButton!
    @IBOutlet weak var hairLossbBtn: UIButton!
    @IBOutlet weak var dandruffsBtn: UIButton!
    @IBOutlet weak var wrinklesBtn: UIButton!
    @IBOutlet weak var jawlinCheckImg: UIImageView!
    @IBOutlet weak var hairLossCheckImg: UIImageView!
    @IBOutlet weak var dandruffsCheckImg: UIImageView!
    @IBOutlet weak var wrinklesCheckImg: UIImageView!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jawlineImgView.layer.borderWidth = 4
        jawlineImgView.layer.borderColor = UIColor.clear.cgColor
        
        
        jawlinCheckImg.isHidden = true
        hairLossCheckImg.isHidden = true
        dandruffsCheckImg.isHidden = true
        wrinklesCheckImg.isHidden = true
        
        //Fetch the offerings from Revenuecat
        Purchases.shared.offerings { (offerings, error) in
            if let offerings = offerings {
                let offer = offerings.current
                let packages = offer?.availablePackages
                
                guard packages != nil else{
                    return
                }
                //Loop through packages
                for i in 0...packages!.count-1 {
                    
                    //Get a refrence to the package
                    let package = packages![i]
                    
                    //Get a refrence to the product
                    let product = package.product
                    
                    //Product title
                    let title = product.localizedTitle
                    
                    //Product Price
                    let price = product.price
                    
                    //Product duration
                    var duration = ""
                    let subscriptionPeriod = product.subscriptionPeriod
                    
                    switch subscriptionPeriod!.unit{
                    
                    case SKProduct.PeriodUnit.year:
                        duration = "/(subscriptionPeriod?.unit)Year"
                    case SKProduct.PeriodUnit.month:
                        duration = "/(subscriptionPeriod?.unit)Month"
                    case SKProduct.PeriodUnit.week:
                        duration = "/(subscriptionPeriod?.unit)Week"
                        
                    @unknown default:
                        duration = ""
                    }
                    
                }
                
            }
        }
        
    }
    
    
    
    
    //MARK:- IBAction
    
    @IBAction func jawlinCheckButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
         
            updateImageAndSaveData(with: jawlineImgView, tickImage: jawlinCheckImg,sender: sender)
        case 1:
            
            updateImageAndSaveData(with: hairLossImgView,  tickImage: hairLossCheckImg,sender: sender)
            
        case 2:
            
            updateImageAndSaveData(with: dandruffsImgView,  tickImage:dandruffsCheckImg ,sender: sender)
            
        case 3:
            
            updateImageAndSaveData(with: wrinklesImgView,  tickImage:wrinklesCheckImg ,sender: sender)
            
        default:break
        }
        
        
        print(selectedBtnArr)
    }
    
    func updateImageAndSaveData(with img: UIImageView, tickImage: UIImageView, sender: UIButton) {
        
        if tickImage.isHidden {
            //unselected, make it selected
            img.layer.borderWidth = 4
            img.layer.borderColor = UIColor.blue.cgColor
        } else {
            //selected, make it unselected
            img.layer.borderWidth = 0
            img.layer.borderColor = UIColor.blue.cgColor
        }
        
        tickImage.isHidden = !tickImage.isHidden
        selectedBtnArr[sender.tag] =  !tickImage.isHidden ? 1 : 0
        
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(AgeVC.instance(), animated: true)
        //continueButtonTapped()
        
        UserDefaults.standard.set(selectedBtnArr, forKey: userDefaultKeys.objectiveArr)
        
        if let val = UserDefaults.standard.value(forKey: userDefaultKeys.objectiveArr) {
            print(val)
        }
    }
    
    @objc fileprivate func continueButtonTapped(){
        print("login tapped")
    }
}
