//
//  StepAndBenefitsVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit

class StepAndBenefitsVC: BaseClass {
    
//MARK:- Outlets
    
@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var crossBtn: UIButton!
    
//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.layer.cornerRadius = 40.0
    }
    

    @IBAction func crossBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:- Extension for TableView Delegate and DataSource

extension StepAndBenefitsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "StepAndBenefitsCellID", for: indexPath) as? StepAndBenefitsCell
            return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
