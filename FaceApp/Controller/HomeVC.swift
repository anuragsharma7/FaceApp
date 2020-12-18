//
//  HomeVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 18/12/20.
//

import UIKit

class HomeVC: UIViewController {
//MARK:- Variables
    var images = [#imageLiteral(resourceName: "Dandruffs"),#imageLiteral(resourceName: "HairLoss")]
    var nameArr = ["Dandreuufs","Back pain"]
    var targetArr = ["Target zone and","Target zone and"]
    
//MArlk:- Outlets
@IBOutlet weak var collectionView: UICollectionView!

    
    
//MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}


//MARK:- Collection view delegates and datasource

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVCCell", for: indexPath) as! HomeVCCell
        
        cell.dantruffImgView.image = images[indexPath.item]
        cell.dandruffLabel.text = nameArr[indexPath.row]
        cell.targetZoneLabel.text = targetArr[indexPath.row]
        return cell
    }
}



//MARK:- Extension for UICollectionViewDelegateFlowLayout

extension HomeVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       // let cellsAcross: CGFloat = 1
       // let spaceBetweenCells: CGFloat = 0.5
//        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
//        return CGSize(width: dim, height: dim)
        let widhth = collectionView.bounds.size.width
        return CGSize(width: 100 , height: 350)
    }
}
//override func viewDidLoad() {
//
//    let topRight = UIView(frame: CGRect(x: 120, y: 200, width: 120, height: 120))
//
//     // Change here the function to set corner radius.
//     topRight.roundedBottom()
//     topRight.backgroundColor = .red
//     self.view.center = topRight.center
//     self.view.addSubview(topRight)
//     super.viewDidLoad()
//  }
