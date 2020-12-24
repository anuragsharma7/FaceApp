//
//  PauseVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 19/12/20.
//

import UIKit

class PauseVC: BaseClass {
    

//MARK:- Outlets
    
@IBOutlet weak var timeToRestLabel: UILabel!
@IBOutlet weak var crossBtn: UIButton!
    
@IBOutlet weak var nextBtn: UIButton!
    
@IBOutlet weak var previousBtn: UIButton!
    

//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        let circularProgress = CircularProgress(frame: CGRect(x: 10.0, y: 30.0, width: 280.0, height: 280.0))
        circularProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        circularProgress.trackColor = UIColor(red: 33.0/255.0, green: 34.0/255.0, blue: 35.0/255.0, alpha: 0.6)
        circularProgress.tag = 101
        circularProgress.center = self.view.center
        self.view.addSubview(circularProgress)
        
        //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1)
    }
    
    
//Mark:- IBActions
    
    
@IBAction func crossButton(_ sender: UIButton) {
    }
    
@IBAction func nextButton(_ sender: UIButton) {
    }
    
    
@IBAction func previousButton(_ sender: UIButton) {
    }

    
    //MARK:- Methods
    @objc func animateProgress() {
        let cp = self.view.viewWithTag(101) as! CircularProgress
        cp.setProgressWithAnimation(duration: 10, value: 1)
    }

}

