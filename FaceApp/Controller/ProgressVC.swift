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
    @IBOutlet weak var progressBar: ProgressCircularProgress!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var yourPhotosLabel: UILabel!
    
    
    
    /// Overall progress
    var progress : Double = 0
    
//MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = true
        perform(#selector(startUpload), with: nil, afterDelay: 1.0)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let circularProgress = ProgressCircularProgress(frame: CGRect(x: 10.0, y: 30.0, width: 50.0, height: 50.0))
        circularProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        circularProgress.trackColor = UIColor(red: 33.0/255.0, green: 34.0/255.0, blue: 35.0/255.0, alpha: 0.6)
        circularProgress.tag = 101
        circularProgress.center = self.view.center
        self.view.addSubview(circularProgress)
        
        //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1)
    
       
    }
    
    @objc func animateProgress() {
        let cp = self.view.viewWithTag(101) as! ProgressCircularProgress
        cp.setProgressWithAnimation(duration: 10, value: 0.25)
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
