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
    self.navigationController?.pushViewController(ExerciseVC.instance(), animated: true)
    
    
    }
    
@IBAction func getBackTrainingButton(_ sender: UIButton) {
    self.navigationController?.pushViewController(ExerciseVC.instance(), animated: true)
    
    }
    
    
 @IBAction func givingUpButton(_ sender: UIButton) {
    
    
    self.navigationController?.pushViewController(RoutineVC.instance(), animated: true)
    
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
