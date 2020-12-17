//
//  LoadingVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit


class LoadingVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var generationLabel: UILabel!
    @IBOutlet weak var customTraining: UILabel!
    @IBOutlet weak var customisationLabel: UILabel!
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customisationLabel.alpha = 1
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.repeat, .autoreverse, .curveEaseInOut], animations: {
            self.customisationLabel.alpha = 0
        }, completion: nil)
        
        //customisationLabel.text = ""
        
        
            
        // Do any additional setup after loading the view, typically from a nib.
        let circularProgress = CircularProgress(frame: CGRect(x: 10.0, y: 30.0, width: 50.0, height: 50.0))
        circularProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        circularProgress.trackColor = UIColor(red: 33.0/255.0, green: 34.0/255.0, blue: 35.0/255.0, alpha: 0.6)
        circularProgress.tag = 101
        circularProgress.center = self.view.center
        self.view.addSubview(circularProgress)
        
        //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1)
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.animateLabelText()
    }

    
    
//MARK:- Methods
@objc func animateProgress() {
    let cp = self.view.viewWithTag(101) as! CircularProgress
    cp.setProgressWithAnimation(duration: 10, value: 1)
}

    
    
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
    
}
    
    
