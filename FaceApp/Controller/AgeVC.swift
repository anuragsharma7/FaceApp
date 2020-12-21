//
//  AgeVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class AgeVC: BaseClass {
    
    //MARK:- Outlets
    
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var slider3VC: UILabel!
    @IBOutlet weak var howOldAreULabel: UILabel!
    @IBOutlet weak var helpUsLabel: UILabel!
    @IBOutlet weak var ageText: UITextField!
    
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageText.delegate = self
    }
    
    
    //MARK:- IBAction
    
    @IBAction func continueButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(HowYouEverVC.instance(), animated: true)
    }
    
}

extension AgeVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        // Create an `NSCharacterSet` set which includes everything *but* the digits
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let components = string.components(separatedBy: inverseSet)
        
        // Rejoin these components
        let filtered = components.joined(separator: "")  // use join("", components) if you are using Swift 1.2
        
        // If the original string is equal to the filtered string, i.e. if no
        // inverse characters were present to be eliminated, the input is valid
        // and the statement returns true; else it returns false
        
        #warning("need to restrict user to enter only two numbers, Will check later")
        //        if ageText.text!.count < 2 {
        //
        //                return false
        //        }
        
        return string == filtered
        
    }
    
}
