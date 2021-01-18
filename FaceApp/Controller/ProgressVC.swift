//
//  ProgressVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 22/12/20.
//

import UIKit

class ProgressVC: BaseClass {
    
    //MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var progressBar: ProgressVCCircularProgress!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var yourPhotosLabel: UILabel!
    
    
    //MARK:- Variables
    var imgUploadArr: [Data] = []
    
    
    //imagepicker
    var imagePicker: ImagePicker = {
        return ImagePicker()
    }()
    
    /// Overall progress
    // var progress : Double = 0
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        progressBar.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
         progressBar.trackColor = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 34.0/255.0, alpha: 0.6)
        progressBar.tag = 101
         //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1)
        
        
    }
    
    @objc func animateProgress() {
        let cp = self.view.viewWithTag(101) as! ProgressVCCircularProgress
        cp.setProgressWithAnimation(duration: 10, value: 0.25)
    }
    
//    @objc func animateProgress() {
//        let cp = self.view.viewWithTag(101) as! ProgressVCCircularProgress
//        cp.setProgressWithAnimation(duration: 10, value: 0.25)
//    }
    
}

//MARK:- Extension for CollectionView Delegate and DataSource
extension ProgressVC: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return section == 0 ? 1 : imgUploadArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCellID", for: indexPath) as! ProgressCell
           
                //cell.uploadPhotoImgView.isHidden =  false
            return cell
        case 1:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCellID2", for: indexPath) as! ProgressCell2
              
             cell.uploadedImage.image = UIImage(data: imgUploadArr[indexPath.row])
             return cell
        default: break
            
        }
        return UICollectionViewCell()
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            guard indexPath.row == 0 else { return }
            
            imagePicker.show(inController: self) { [self] (image) in
                if let image = image {
                    
                 //append image
                    imgUploadArr.append(image.pngData()!)
                    
                    //userdefault
                    UserDefaults.standard.set(imgUploadArr, forKey:"imageKey")
                   
                   if let val = UserDefaults.standard.value(forKey: "imageKey") {
                       print(val)
                    
                }
                    
                    //reload data
                    DispatchQueue.main.async {
                        collectionView.reloadData()
                    }
                }
                
            }
        }
    }
}


extension ProgressVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 200)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5.0
    }
    
}
