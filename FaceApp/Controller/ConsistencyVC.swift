//
//  ConsistencyVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class ConsistencyVC: BaseClass {
    
    //MARK:- Outlets
    
    @IBOutlet weak var proTipLabel: UILabel!
    @IBOutlet weak var keyImgView: UIImageView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- Methods
    
    func registerPushNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("D'oh: \(error.localizedDescription)")
            } else {
                
                DispatchQueue.main.async {
 
                    self.navigationController?.pushViewController(LoadingVC.instance(), animated: true)
                    
                    UIApplication.shared.registerForRemoteNotifications()
 
                }
            }
        }
    }
    
    //MARK:- IBAction
    
    @IBAction func noButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(LoadingVC.instance(), animated: true)
    }
    
    @IBAction func yesButton(_ sender: UIButton) {
        registerPushNotification()
    }
    
}
