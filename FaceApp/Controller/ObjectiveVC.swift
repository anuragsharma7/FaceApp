//
//  ObjectiveVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit
import Purchases
import FirebaseAuth
//import FirebaseFirestore

class ObjectiveVC: BaseClass {
    
    enum Objective: NSNumber {
        case jawlin
        case dandruffs
        case hairLoss
        case wrinkles
    }
    
    //MARK:- Variables
    var authStateDidChangeListenerHandle:AuthStateDidChangeListenerHandle?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({(auth,user) in
            if user !=  nil{
                print("user is nil")
            }
            guard let user = user else{return}
            let uid = user.uid
            print("Found User with uid: \(uid)")
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let authStateDidChangeListenerHandle = authStateDidChangeListenerHandle else{return}
        Auth.auth().removeStateDidChangeListener(authStateDidChangeListenerHandle)
    }
       
    //MARK:- IBAction
   
    @IBAction func jawlinCheckButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            
            updateImageAndSaveData(with: jawlinCheckImg, sender: sender)
        case 1:
            
            updateImageAndSaveData(with: hairLossCheckImg, sender: sender)
            
        case 2:
            
            updateImageAndSaveData(with: dandruffsCheckImg, sender: sender)
            
        case 3:
            
            updateImageAndSaveData(with: wrinklesCheckImg, sender: sender)
            
        default:break
        }
        
        
        print(selectedBtnArr)
    }
    
    func updateImageAndSaveData(with img: UIImageView, sender: UIButton) {
        img.isHidden = !img.isHidden
        selectedBtnArr[sender.tag] =  !img.isHidden ? 1 : 0
        
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
        let auth = Auth.auth()
        auth.signInAnonymously{(result,err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            print("Successfully login in firebase auth")
        }
    }
}
