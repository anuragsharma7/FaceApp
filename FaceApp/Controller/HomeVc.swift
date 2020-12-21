//
//  HomeVc.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit

class HomeVc: UIViewController {
    
//MARK:- Variables
    

//MARK:- Outlets
    
@IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    

}

//MARK:- Extension for CollectionView DataSource and Delegates

extension HomeVc: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVCCell", for: indexPath) as? HomeVCCell {
//            return cell
//        }
        return UICollectionViewCell()
    }
    
    
}
