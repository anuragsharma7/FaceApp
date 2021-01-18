//
//  PaymentWithTrialVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//
import Purchases
import UIKit
import StoreKit

class PaymentWithTrialVC: BaseClass {
    
    //MARK:- Outlets
    @IBOutlet weak var backBtnOutlet: UIButton!
    @IBOutlet weak var unLockLabel: UILabel!
    
    @IBOutlet weak var newLifeStartLabel: UILabel!
    
    @IBOutlet weak var star1ImgView: UIImageView!
    
    @IBOutlet weak var star2ImgView: UIImageView!
    
    @IBOutlet weak var star3ImgView: UIImageView!
    @IBOutlet weak var star4ImgView: UIImageView!
    
    @IBOutlet weak var star5ImgView: UIImageView!

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var trialImgView: UIImageView!
    
    @IBOutlet weak var notCommitmentLabel: UILabel!
    
    @IBOutlet weak var tryNowBtnOutlet: UIButton!
    
    @IBOutlet weak var weeklyBtnOutlet: UIButton!
    
    @IBOutlet weak var monthlyBtnOutlet: UIButton!
    @IBOutlet weak var annualyBtnOutlet: UIButton!
    
    @IBOutlet weak var lineLabel: UILabel!
    
    @IBOutlet weak var restoreLabel: UILabel!
    @IBOutlet weak var tAndCLabel: UILabel!
       
    var packagesAvailableForPurchases = [Purchases.Package]()
    
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fetchProducts()
        
        Purchases.shared.offerings { [self] (offerings, error) in
            if let offerings = offerings {
                // Display current offering with offerings.current
                
                let offer = offerings.current
                let packages = offer?.availablePackages
                
                guard packages != nil else {
                    return
                }
                // Loop through packages
                for i in 0...packages!.count - 1{
                    
                    // Get a reference to the package
                    
                    let package = packages![i]
                    print("Packages ====>",package)
                    // Store a reference to the package at the same index as we are going to tag the button with
                    self.packagesAvailableForPurchases.append(package)
                    
                    // Get a reference to thge product
                    
                    let product = package.product
                    print("product ====>",product)
                    // product title
                    let title = product.localizedTitle
                    print("title ====>",title)
                    
                    // product price
                    let price = product.price
                    print("price ====>",price)
                    
                    // product duration
                    var duration = ""
                    let subscriptionPeriod = product.subscriptionPeriod
                    print("subscriptionPeriod ====>",subscriptionPeriod)
                    
                    switch subscriptionPeriod!.unit {
                    case SKProduct.PeriodUnit.month:
                        duration = "\(subscriptionPeriod!.numberOfUnits) Month"
                        print("duration ====>",duration)
                        monthlyBtnOutlet.setTitle(title + "" + duration + "" + price.stringValue , for: .normal)
                        
                        break
                        
                    case SKProduct.PeriodUnit.year:
                        duration = "\(subscriptionPeriod!.numberOfUnits) Year"
                        annualyBtnOutlet.setTitle(title + "" + duration + "" + price.stringValue , for: .normal)
                        print("duration ====>",duration)
                        break
                        
                    case SKProduct.PeriodUnit.week:
                        duration = "\(subscriptionPeriod!.numberOfUnits) Week"
                        weeklyBtnOutlet.setTitle(title + "" + duration + "" + price.stringValue , for: .normal)
                        print("duration ====>",duration)
                        break
                    default:
                        duration = ""
                        break
                    }
                    
                }
                
            }
        }
        
        
       // spaceBetweenSVAndMainView?.constant = 45
        if DEVICE_HEIGHT == 667 {
          //  spaceBetweenSVAndMainView?.constant = 45
        }
        else {
            //spaceBetweenSVAndMainView.constant = 173
        }
        
    }
    
    //MARK:- Functions
    
    func pop()  {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- IBActions
    //Divya
    @IBAction func backButton(_ sender: UIButton) {
        pop()
    }
    
    @IBAction func weeklyButton(_ sender: UIButton) {
        
        guard self.packagesAvailableForPurchases.count != 0 else { return }
        
        let package = self.packagesAvailableForPurchases[0]
        //  let package = self.packagesAvailableForPurchases
        Purchases.shared.purchasePackage(package) { (transaction, purchaserInfo, error, userCancelled) in
            if purchaserInfo?.entitlements.all["pro"]?.isActive == true {
                // Unlock that great "pro" content
                
                
                self.navigationController?.pushViewController(HomeVc.instance(), animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        
        self.navigationController?.pushViewController(HomeVc.instance(), animated: true)
    }
    
    @IBAction func monthlyButton(_ sender: UIButton) {
        guard self.packagesAvailableForPurchases.count != 0 else { return }
//        let package = self.packagesAvailableForPurchases[sender.tag]
        let package = self.packagesAvailableForPurchases[1]
        Purchases.shared.purchasePackage(package) { (transaction, purchaserInfo, error, userCancelled) in
            if purchaserInfo?.entitlements.all["pro"]?.isActive == true {
                // Unlock that great "pro" content
                
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func annualyButton(_ sender: UIButton) {
        guard self.packagesAvailableForPurchases.count != 0 else { return }
//        let package = self.packagesAvailableForPurchases[sender.tag]
        let package = self.packagesAvailableForPurchases[2]
        Purchases.shared.purchasePackage(package) { (transaction, purchaserInfo, error, userCancelled) in
            if purchaserInfo?.entitlements.all["pro"]?.isActive == true {
                // Unlock that great "pro" content
                
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func tryNowButton(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(RoutineVC.instance(), animated: true)
    }
    
    
}
