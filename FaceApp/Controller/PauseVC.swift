//
//  PauseVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 19/12/20.
//

import UIKit

class PauseVC: BaseClass {
    

//MARK:- Outlets
    
@IBOutlet weak var circularProgress: CircularProgress!
    
@IBOutlet weak var timeToRestLabel: UILabel!
@IBOutlet weak var crossBtn: UIButton!
    
@IBOutlet weak var nextBtn: UIButton!
    
@IBOutlet weak var previousBtn: UIButton!
    

//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        //let circularProgress = CircularProgress(frame: CGRect(x: 0.0, y: 0.0, width: 180.0, height: 180.0))
        circularProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        circularProgress.trackColor = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 34.0/255.0, alpha: 0.6)
        circularProgress.tag = 101
        //circularProgress.center = self.view.center
        //self.view.addSubview(circularProgress)
        
        //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1)
        
        
    }
    
    
//Mark:- IBActions
    
//Divya
@IBAction func crossButton(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
    self.dismiss(animated: true, completion: nil)
    }
    
@IBAction func nextButton(_ sender: UIButton) {
    self.navigationController?.pushViewController(WorkOutVC.instance(), animated: true)
    }
    
    
@IBAction func previousButton(_ sender: UIButton) {
    }

    
    //MARK:- Methods
    @objc func animateProgress() {
        let cp = self.view.viewWithTag(101) as! CircularProgress
        cp.setProgressWithAnimation(duration: 10, value: 0.25)
    }

}

