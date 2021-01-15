//
//  HomeVc.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//
import Purchases
import UIKit
import FirebaseFirestore
import SDWebImage

struct Placeholders {
    static let UserProfile = #imageLiteral(resourceName: "cross")
}

class HomeVc: BaseClass {
    
    //MARK:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var proUnlockButton: UIButton!
    
    //MARK:- Variables
    private var routineCollectionRef: CollectionReference!
    private var targetCollectionRef: CollectionReference!
    
    var postData = [String]()
    //Array for Routine Excercises
    var RoutineArr: [Routine] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    //Array for Targeted Excercises
    var TargetedArr: [Targeted] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK:- View Life Cycle:-
    override func viewDidLoad() {
        super.viewDidLoad()
        routineCollectionRef = Firestore.firestore().collection("Routine")
        targetCollectionRef = Firestore.firestore().collection("Targeted")
        getRoutineDocument()
        getTargetDocument()
        setCollectionDelegate()
        registerHeaderNib()
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
    
    //MARK:- IBAction:-
    @IBAction func unlockAllBtnForPay(_ sender: Any) {
        self.navigationController?.pushViewController(PaymentWithTrialVC.instance(), animated: true)
    }
    
    //MARK:- Methods:-
    private func getRoutineDocument() {
        routineCollectionRef.getDocuments { [self] (snapShot, error) in
            if let error = error {
                debugPrint("Error fetching docs: \(error)")
            } else {
                guard let snap = snapShot else { return }
                for doc in snap.documents {
                    let VideoObj = doc.data()
                    let video = Routine(info: VideoObj)
                    RoutineArr.append(video)
                }
            }
        }
    }
    
    private func getTargetDocument() {
        targetCollectionRef.getDocuments { [self] (snapShot, error) in
            if let error = error {
                debugPrint("Error fetching docs: \(error)")
            } else {
                guard let snap = snapShot else { return }
                for doc in snap.documents {
                    let VideoObj = doc.data()
                    let video = Targeted(info: VideoObj)
                    TargetedArr.append(video)
                }
            }
        }
    }
    
    private func setCollectionDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //Register Custom Header View nib
    private func registerHeaderNib() {
        collectionView.register(UINib(nibName: "HomeCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionReusableView.identifier)
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
}

//MARK:- Extension for CollectionView DataSource and Delegates
extension HomeVc: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? self.RoutineArr.count : self.TargetedArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0: //Routine section
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVCCell.identifier, for: indexPath) as? HomeVCCell {
                cell.routine = RoutineArr[indexPath.row]
                return cell
            }
        case 1: //Targeted section
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVCCell.identifier, for: indexPath) as? HomeVCCell {
                cell.lblTitle.text = TargetedArr[indexPath.row].painPoint
                cell.lblSubTitle.text = TargetedArr[indexPath.row].name
                cell.imgBg.sd_setImage(with: URL(string: TargetedArr[indexPath.row].thumbImage!), placeholderImage: Placeholders.UserProfile, options: SDWebImageOptions(rawValue: 0)) { (image, error, type, url) in
                }
                return cell
            }
        default: break
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
}

extension HomeVc: UICollectionViewDelegate {
     
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("anurag")
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.section {
//        case 0:
//            let vc = storyboard?.instantiateViewController(withIdentifier: "RoutineVC") as! RoutineVC
//            vc.videosArr = RoutineArr[indexPath.row].videos
//            self.navigationController?.pushViewController(vc, animated: true)
//        case 1:
//            let vc = storyboard?.instantiateViewController(withIdentifier: "RoutineVC") as! RoutineVC
//            vc.videosArr = TargetedArr[indexPath.row].videos
//            self.navigationController?.pushViewController(vc, animated: true)
//        default: break
//        }
//    }
    
    //set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.size.width
        return section == 0 ? CGSize(width: width, height: 558) : CGSize(width: width, height: 100)
    }
}

extension HomeVc: UICollectionViewDelegateFlowLayout {
    //Set item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
