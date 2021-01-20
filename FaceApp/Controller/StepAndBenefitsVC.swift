//
//  StepAndBenefitsVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit

class StepAndBenefitsVC: BaseClass {
    
    //Mark: Variables
    var videosArr: [[String: Any]] = [[:]]
    var benefitsArr: [String] = []
    var stepsArr: [String] = []
    var headingArr = ["Steps","Benefites"]
    
//MARK:- Outlets
    
@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var crossBtn: UIButton!
    
//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.layer.cornerRadius = 40.0
        
        print(benefitsArr)
        print(stepsArr)
        
    }
    

    @IBAction func crossBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:- Extension for TableView Delegate and DataSource

extension StepAndBenefitsVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return section == 0 ? stepsArr.count : benefitsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        if indexPath.section == 0 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "StepAndBenefitsCellID", for: indexPath) as? StepAndBenefitsCell
          
            cell!.lblForSteps1.text = stepsArr[indexPath.row]
        
            return cell!
        }
        else if indexPath.section == 1 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "StepAndBenefitsCellID", for: indexPath) as? StepAndBenefitsCell
         
            cell!.lblForSteps1.text = benefitsArr[indexPath.row]
         
            return cell!
        }
        return UITableViewCell()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        lblTitle.contentMode = .left
        lblTitle.textColor = .white
        lblTitle.font = .systemFont(ofSize: 18)
        lblTitle.font = .boldSystemFont(ofSize: 18)
        view.addSubview(lblTitle)
        
        switch section {
        case 0:
            lblTitle.text = "Steps"
        case 1:
            lblTitle.text = "Benefits"
        default: break
        }
        
        return view
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    
    }
}
