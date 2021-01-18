//
//  RoutineVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit
import AVFoundation

class RoutineVC: BaseClass {
    
    //MARK:- Variables
    var aboutArr = ["About this program","Expected results"]
    var tiltArr = ["Tilt your head back until you're lookin at the ceiling","Tilt your head back until you're lookin at the ceiling."]
    var marylineArr = ["The Marylin 5 times","The Marylin 5 times","The Marylin 5 times","The Marylin 5 times"]
    
    
    var videosArr: [Videos] = []
    
    // MARK:- Outlets
    
    @IBOutlet weak var StartWorkoutBottmY: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var calendarImgView: UIImageView!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var watchImgView: UIImageView!
    @IBOutlet weak var startWorkOutBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getVideos()
//        print("videosArr")
//         print("============>>>>>>",videosArr)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainView.layer.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        
        if DEVICE_HEIGHT >= 1200 {
            StartWorkoutBottmY.constant = 190
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK:- IBActions
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startWorkOutButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(ExerciseVC.instance(), animated: true)
    }
    
    //MARK:- Methods
    
    func getVideos() {
        
    }
    
    func generateThumbnail(videoUrl: String) -> UIImage? {
        
        do {
            let url = URL(string: videoUrl)
            let asset = AVURLAsset(url: url!)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imageGenerator.copyCGImage(at: CMTime(seconds: 2.0, preferredTimescale: 60), actualTime: nil)
            
            return UIImage(cgImage: cgImage)
            
        } catch {
            
            print(error.localizedDescription)
            return nil
        }
    }
    
}

//MARK:- Extension for TableView DataSource And Delegate
extension RoutineVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? aboutArr.count : videosArr.count
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
            
//            cell?.playBtn.addTarget(self, action: Selector(("playButton:")), for: UIControl.Event.touchUpInside)
            
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

extension CALayer {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        mask = shape
    }
}

