//
//  HomeVc.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//
import Purchases
import UIKit
import FirebaseFirestore
import FirebaseDatabase


class HomeVc: BaseClass {
    
    //MARK:- Variables
    
    
    //MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let database = Database.database().reference()
    
    var postData = [String]()
    @IBOutlet weak var proUnlockButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Register Custom Header View nib
        
        collectionView.register(UINib(nibName: "HomeCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionReusableView.identifier)
        
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // CHeck entitlements and show pro Conten0t
        Purchases.shared.purchaserInfo { (purchaserInfo, error) in
            if purchaserInfo?.entitlements.all["pro"]?.isActive == true {
                // User is "pro"
                self.proUnlockButton.removeFromSuperview()
            }
        }
    }
    
    
    
    
    
    
    @IBAction func unlockAllBtnForPay(_ sender: Any) {
        self.navigationController?.pushViewController(PaymentWithTrialVC.instance(), animated: true)
    }
}






//MARK:- Extension for CollectionView DataSource and Delegates

extension HomeVc: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVCCellID", for: indexPath) as? HomeVCCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            switch indexPath.section {
            case 0:
                let headerView = self.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionReusableView.identifier, for: indexPath) as! HomeCollectionReusableView
                return headerView
            case 1:
                let secondHeaderView = self.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
                return secondHeaderView
                
            default:
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
    
    //set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: view.frame.size.width, height: 558)
        case 1:
            return CGSize(width: view.frame.size.width, height: 100)
        default:
            return CGSize()
        }
    }
    
    //Set item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let yourWidth = collectionView.bounds.width/2.0
          // let yourHeight = yourWidth

          // return CGSize(width: yourWidth, height: yourHeight)
        
        //let width = (self.view.frame.size.width - 12 * 3) / 3 //some width
           // let height = width * 1.5 //ratio
           // return CGSize(width: width, height: height)
        
        //return CGSize(width: 192, height: 250)
        let width = (self.view.frame.size.width - 12 * 3) / 3 //some width
        let height = width * 1.5  //ratio
            return CGSize(width: 165, height: 250)
   
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
            
        case 1:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
            break
           
            
        default:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
            
        }
        
        
        
        
        
    }
}


