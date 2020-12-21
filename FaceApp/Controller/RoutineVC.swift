//
//  RoutineVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit

class RoutineVC: UIViewController {
   
//MARK:- Variables
    var aboutArr = ["About this program","Expected results"]
    var tiltArr = ["Tilt your head back until you're lookin at the ceiling","Tilt your head back until you're lookin at the ceiling."]
    var marylineArr = ["The Marylin 5 times","The Marylin 5 times","The Marylin 5 times","The Marylin 5 times"]
    
    var playBtnArr = ["","","",""]
    
    
// MARK:- Outlets
    
@IBOutlet weak var tableView: UITableView!
    

//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.layer.cornerRadius = 40.0

        
    }
    

    

}

//MARK:- Extension for TableView DataSource And Delegate
extension RoutineVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return playBtnArr.count
        }
        
        return aboutArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
              let cell =  tableView.dequeueReusableCell(withIdentifier: "RoutineCell", for: indexPath) as? RoutineCell
            
            cell!.aboutLabel.text = aboutArr[indexPath.row]
            cell!.tiltLabel.text = tiltArr[indexPath.row]
            return cell!
        }
        else if indexPath.section == 1 {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "RoutineCell2", for: indexPath) as? RoutineCell2
            cell?.marylineLabel.text = marylineArr[indexPath.row]
            //cell?.playBtn = playBtnArr[indexPath.row]
            cell?.playBtn.addTarget(self, action: Selector(("playButton:")), for: UIControl.Event.touchUpInside)
        
        return cell!
    }
        return UITableViewCell()
    
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
}
