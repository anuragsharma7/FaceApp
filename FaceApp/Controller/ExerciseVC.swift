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
    
    //MARK:- Variables
    
    var playerController = AVPlayerViewController()
    var player:AVPlayer?
    let video1URL = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    var currentProgressTime:Float = 0.0
    
//MARK:- Outlets
    
@IBOutlet weak var numberLabel: UILabel!
    
@IBOutlet weak var headerImgVIew: UIImageView!
    
@IBOutlet weak var playBtnOutlet: UIButton!
    @IBOutlet weak var playImage: UIImageView!
    
    @IBOutlet weak var videoView: UIView!
  
    
    @IBOutlet weak var progressView: ButtonProgressVC!
    
    
//MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ProgressBar
        progressView.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
         progressView.trackColor = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 34.0/255.0, alpha: 0.6)
        progressView.tag = 101
         //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1)
        let data = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        print("====================================+++++++++++++++++++++++++++++++++++++",getVideoDuration(from: URL(string: data)!))
        self.playImage.isHidden = false
        self.playImage.image = #imageLiteral(resourceName: "play")
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
    
    
    @objc func animateProgress() {
        let cp = self.view.viewWithTag(101) as! ButtonProgressVC
        cp.setProgressWithAnimation(duration: 10, value: 0.25)
    }
    
    
    //Functions
      
      func initPlayer()  {
              if let play = player {
                  print("playing")
                  play.play()
              } else {
                  print("player allocated")
                  let videoURL = URL(string: video1URL)
                  player = AVPlayer(url: videoURL!)
                  let playerLayer = AVPlayerLayer(player: player)
                      playerLayer.frame = self.videoView.bounds
                      self.videoView.layer.addSublayer(playerLayer)
                  print("playing")
                  let currentItem:AVPlayerItem = player!.currentItem!
                  print("currentItem=============>",currentItem)
                  let currentTime:TimeInterval = CMTimeGetSeconds(currentItem.currentTime())
                  print("currentTime=============>",currentTime)
                  let t1 = Float((self.player?.currentTime().value)!)
                  print("t1{currentTime}=============>",t1)
                currentProgressTime = Float(( self.player?.currentTime().timescale)!)
                  print("currentProgressTime{timescale}=============>",currentProgressTime)
                  let currentSeconds = t1 / currentProgressTime
                //userdefault
                UserDefaults.standard.set(currentProgressTime, forKey:"videototaltime")
               
               if let val = UserDefaults.standard.value(forKey: "videototaltime") {
                   print("Total Video Time ===========>",val)
                  print("currentSeconds=============>",t1 / currentProgressTime)
                  player!.play()
              }
          }
      }
          func stopPlayer() {
              if let play = player {
                
               // progressView.isHidden = true
                  print("stopped")
                  play.pause()
                 // player = nil
                  NotificationCenter.default.addObserver(self, selector: #selector(playerStalled),
                                                               name: NSNotification.Name.AVPlayerItemPlaybackStalled, object: player?.currentItem)
                  print("player deallocated")
              } else {
                  print("player was already deallocated")
              }
          }
      
    @objc func playerStalled(note: NSNotification) {
        let playerItem = note.object as! AVPlayerItem
          if let player = playerItem.value(forKey: "player") as? AVPlayer{
          player.play()
        }
      }
    
    
//MARK:- IBActions
    
    @IBAction func btnStart(_ sender: Any) {
        
        if playBtnOutlet.imageView?.image == #imageLiteral(resourceName: "play") {
            initPlayer()
            self.playImage.image = #imageLiteral(resourceName: "videoplay")
            playBtnOutlet.imageView?.image = #imageLiteral(resourceName: "videoplay")
        }
        else {
            stopPlayer()
            self.playImage.image = #imageLiteral(resourceName: "play")
            playBtnOutlet.imageView?.image = #imageLiteral(resourceName: "play")
        }
    }
        
   
    @IBAction func benifitesBtn(_ sender: Any) {
         present(StepAndBenefitsVC.instance(), animated: true, completion: nil)
    }
    
@IBAction func crossButton(_ sender: UIButton) {
    stopPlayer()
    self.playImage.image = #imageLiteral(resourceName: "play")
    playBtnOutlet.imageView?.image = #imageLiteral(resourceName: "play")
    present(ExercisePopUpVC.instance(), animated: true, completion: nil)
    }
@IBAction func nextButton(_ sender: UIButton) {
    
    stopPlayer()
    self.playImage.image = #imageLiteral(resourceName: "play")
    playBtnOutlet.imageView?.image = #imageLiteral(resourceName: "play")
    
    self.navigationController?.pushViewController(PauseVC.instance(), animated: true)

    }
    
@IBAction func previousButton(_ sender: UIButton) {
    stopPlayer()
    self.playImage.image = #imageLiteral(resourceName: "play")
    playBtnOutlet.imageView?.image = #imageLiteral(resourceName: "play")
    self.navigationController?.pushViewController(RoutineVC.instance(), animated: true)
    }
}
