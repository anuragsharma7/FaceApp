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
   
    
    func checkMandatoryFields(){

       //CHECK EMPTY FIELDS
       if let age = ageText.text , age.isEmpty {
           print("Mandatory fields are: ")
           errorDisplay(userMessage: "Please enter the age.")
           return
       }

       //CHECK SPACE ONLY FIELDS
   }
    
    func errorDisplay(userMessage:String){

        let myAlert = UIAlertController(title: "WOF", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
     }
    
    //MARK:- IBAction
    
    @IBAction func continueButton(_ sender: UIButton) {
        checkMandatoryFields()
        self.navigationController?.pushViewController(HowYouEverVC.instance(), animated: true)
        
        
        UserDefaults.standard.set(ageText.text, forKey:"ageKey")
       
       if let val = UserDefaults.standard.value(forKey: "ageKey") {
           print(val)
        
    }
    
//     func checkMandatoryFields(){
//
//        //CHECK EMPTY FIELDS
//        if let age = ageText.text , age.isEmpty {
//            print("Mandatory fields are: ")
//            errorDisplay(userMessage: "Please enter the age.")
//            return
//        }
//
//        //CHECK SPACE ONLY FIELDS
//    }
//    func errorDisplay(userMessage:String){
//
//        let myAlert = UIAlertController(title: "WOF", message: userMessage, preferredStyle: UIAlertController.Style.alert)
//        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
//        myAlert.addAction(okAction)
//        self.present(myAlert, animated: true, completion: nil)
//     }
    
    
    
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


