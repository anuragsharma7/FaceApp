//
//  ExerciseVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit
import CoreMedia
import AVKit

class ExerciseVC: BaseClass, AVPlayerViewControllerDelegate {
    
//MARK:- Outlets
    
@IBOutlet weak var numberLabel: UILabel!
    
@IBOutlet weak var headerImgVIew: UIImageView!
    
@IBOutlet weak var playBtnOutlet: UIButton!
    @IBOutlet weak var playImage: UIImageView!
    
    @IBOutlet weak var videoView: UIView!
    
  var playerController = AVPlayerViewController()
    
//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        print("====================================+++++++++++++++++++++++++++++++++++++",getVideoDuration(from: URL(string: data)!))
        self.playImage.isHidden = false
        self.playImage.image = #imageLiteral(resourceName: "play")
        
//        let data = "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4"
//               let a = URL(string: data)
//        let asset = AVURLAsset(url: a! as URL)
//
//        let duration = asset.duration.seconds
//        let durationTime = CMTimeGetSeconds(duration)
//
////               print("the duration is",durationTime)
//        print("the duration is",duration)
    }
//Mark:- Methods
    
    //Don't forget to import AVFoundation
    func getVideoDuration(from path: URL) -> String {
        let asset = AVURLAsset(url: path)
        let duration: CMTime = asset.duration
      
        let totalSeconds = CMTimeGetSeconds(duration)
        let hours = Int(totalSeconds / 3600)
        let minutes = Int((totalSeconds.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))

        if hours > 0 {
            return String(format: "%i:%02i:%02i", hours, minutes, seconds)
        } else {
            return String(format: "%02i:%02i", minutes, seconds)
        }
    }
    
//MARK:- IBActions
    
    @IBAction func btnStart(_ sender: Any) {
        
        if playImage.image == #imageLiteral(resourceName: "play") {
            self.playImage.image = #imageLiteral(resourceName: "videoplay")
            
            let videoURL = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            let player = AVPlayer(url: videoURL!)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoView.bounds
            self.videoView.layer.addSublayer(playerLayer)
            player.play()
            
            
            
        }
        else{
            self.playImage.image = #imageLiteral(resourceName: "play")
            
            let videoURL = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            let player = AVPlayer(url: videoURL!)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoView.bounds
            self.videoView.layer.addSublayer(playerLayer)
            player.pause()
        }
        
//        guard let url = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")else{return}
//
//       let player = AVPlayer(url: url)
//        playerController = AVPlayerViewController()
//        playerController.player = player
//        playerController.allowsPictureInPicturePlayback = true
//        playerController.delegate = self
//        playerController.player?.play()
//        self.present(playerController, animated: true, completion: nil)
        
        
       // player.pause()
        
    }
    
    @IBAction func benifitesBtn(_ sender: Any) {
        
//        self.navigationController?.pushViewController(StepAndBenefitsVC.instance(), animated: true)
        present(StepAndBenefitsVC.instance(), animated: true, completion: nil)
    }
    
    
    
@IBAction func crossButton(_ sender: UIButton) {
   // self.navigationController?.pushViewController(ExercisePopUpVC.instance(), animated: true)
    present(ExercisePopUpVC.instance(), animated: true, completion: nil)
    }
@IBAction func nextButton(_ sender: UIButton) {
    
//    self.navigationController?.pushViewController(PauseVC.instance(), animated: true)
    
    let vc = PauseVC.instance()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)

    }
    
@IBAction func previousButton(_ sender: UIButton) {
    
    self.navigationController?.pushViewController(RoutineVC.instance(), animated: true)
    }
}
