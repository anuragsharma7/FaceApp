//
//  ExercisePopUpVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 24/12/20.
//

import UIKit

class ExercisePopUpVC: BaseClass {
    
    //MARK:- Outlets
    
    @IBOutlet weak var crossBtnOutlet: UIButton!
    @IBOutlet weak var gettingBackBtnOutlet: UIButton!
    @IBOutlet weak var givingUpBtnOutlet: UIButton!
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- IBActions
    @IBAction func crossButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func getBackTrainingButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func givingUpButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeVc.instance(), animated: true)
    }
}
