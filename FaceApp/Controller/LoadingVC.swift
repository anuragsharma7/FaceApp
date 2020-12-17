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
        
        customisationLabel.text = ""
        
        
            
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
        self.animateLabelText()
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
    
    func animateLabelText() {
        
        customisationLabel.text = ""
        
        let appName = (Bundle.main.infoDictionary?["Customisation according to your age."] as? String) ??  "Customisation according to your age."

        // New code using Timer class
        
        let characters = appName.map { $0 }
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { [weak self] timer in
            if index < appName.count {
                let char = characters[index]
                self?.customisationLabel.text! += "\(char)"
                index += 1
            } else {
                timer.invalidate()
            }
        })


    }
}


//extension UILabel {
//            //MARK: StartBlink
//            func startBlink() {
//                      UIView.animate(withDuration: 0.8,//Time duration
//                                    delay:0.0,
//                                    options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
//                                    animations: { self.alpha = 0 },
//                                    completion: nil)
//            }
//
//            //MARK: StopBlink
//            func stopBlink() {
//                      layer.removeAllAnimations()
//                      alpha = 1
//            }
//}

//extension UILabel {
//    func blink() {
//        self.alpha = 0.0;
//        UIView.animate(withDuration: 0.8, //Time duration you want,
//            delay: 0.0,
//            options: [.curveEaseInOut, .autoreverse, .repeat],
//            animations: { [weak self] in self?.alpha = 1.0 },
//            completion: { [weak self] _ in self?.alpha = 0.0 })
//    }
//
//
//}
