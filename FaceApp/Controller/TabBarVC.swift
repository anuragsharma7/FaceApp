//
//  TabBarVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 22/12/20.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor(red: 254/255.0, green: 105/255.0, blue: 51/255.0, alpha: 100.0)

           for i in 0 ..< self.tabBar.items!.count {

               switch i {

               case 1:

                   tabBar.items?[1].title = "Progress"
                   let firstTab = self.tabBar.items![i] as UITabBarItem
                 firstTab.image = UIImage(named: "progress")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                firstTab.selectedImage = UIImage(named: "progress")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                firstTab.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 5, right: 0)
                firstTab.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)


               case 0:
                     
                   //loadURL()
                 tabBar.items?[0].title = "Training"
                   let secondTab = self.tabBar.items![i] as UITabBarItem
                secondTab.image = UIImage(named: "training")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                  secondTab.selectedImage = UIImage(named: "training")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                secondTab.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 5, right: 0)
                secondTab.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)


               default:
                   break
               }
           }
        
        
        
        
       }

    
  class func instance() -> TabBarVC {
            let className = String(describing: self)
            return kMainStoryboard.instantiateViewController(withIdentifier: className) as! TabBarVC
        }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        


           }

       }


