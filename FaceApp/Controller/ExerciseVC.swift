//
//  ExerciseVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit

class ExerciseVC: BaseClass {
    
//MARK:- Outlets
    
@IBOutlet weak var numberLabel: UILabel!
    
@IBOutlet weak var headerImgVIew: UIImageView!
    
@IBOutlet weak var playBtnOutlet: UIButton!
    

//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

//MARK:- IBActions
@IBAction func crossButton(_ sender: UIButton) {
   // self.navigationController?.pushViewController(ExercisePopUpVC.instance(), animated: true)
    present(ExercisePopUpVC.instance(), animated: true, completion: nil)
    }
@IBAction func nextButton(_ sender: UIButton) {
    
    self.navigationController?.pushViewController(PauseVC.instance(), animated: true)
    }
    
@IBAction func previousButton(_ sender: UIButton) {
    
    self.navigationController?.pushViewController(RoutineVC.instance(), animated: true)
    }
    
    

}
