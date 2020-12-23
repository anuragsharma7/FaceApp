//
//  ProgressVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 22/12/20.
//

import UIKit

class ProgressVC: UIViewController {

//MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var progressBar: CircularProgressBar!
    
    
    /// Overall progress
    var progress : Double = 0
    
//MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = true
        perform(#selector(startUpload), with: nil, afterDelay: 1.0)
       
    }
    
    
    //MARK: - Start uploading
    @objc func startUpload() {
//        progressBar.labelSize = 15
//        progressBar.safePercent = 100
//        progressBar.setProgress(to: progress, withAnimation: true)
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        //timer.fire()
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc func updateProgress() {
        
        //progressBar.setProgress(to: progress, withAnimation: true)
        progress = progress + 0.06
    }


    

}

//MARK:- Extension for CollectionView Delegate and DataSource
extension ProgressVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCell", for: indexPath) as! ProgressCell
        cell.imgView.image = UIImage(named: "")
        return cell
              
}
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 200)
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 25
//    }
//
    
    
}
