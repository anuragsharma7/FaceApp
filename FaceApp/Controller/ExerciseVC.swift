//
//  ExerciseVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit
import CoreMedia
import AVKit
import KDCircularProgress

class ExerciseVC: BaseClass, AVPlayerViewControllerDelegate {
    
    //MARK:- Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var headerImgVIew: UIImageView!
    @IBOutlet weak var playBtnOutlet: UIButton!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var progress: KDCircularProgress!
    
    //MARK:- Variables
   
    @IBOutlet weak var lblNumberOfTimes: UILabel!
    var player:AVPlayer?
    var playerLayer: AVPlayerLayer?
    let video1URL = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
   // var currentProgressTime:Float = 0.0
    var videoFromBackend : [[String: Any]] = [[:]]
    var currentVideoIndex: Int? = 0
    var lastProgressAngle: Double = 0.0
    var currentProgressTime:Float = 0.0
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBtnOutlet.imageView?.image = #imageLiteral(resourceName: "play")
                self.playImage.image = #imageLiteral(resourceName: "play")

                progress.startAngle = -90
                progress.progressThickness = 0.2
                progress.trackThickness = 0.3
                progress.clockwise = true
                progress.gradientRotateSpeed = 0
                progress.roundedCorners = false
                progress.glowMode = .noGlow
                progress.glowAmount = 0.0
                progress.set(colors: UIColor.white)
                progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        
        // let data = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        let data = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        print("================++++++++++++++",getVideoDuration(from: URL(string: data)!))
        self.playImage.isHidden = false
        self.playImage.image =  #imageLiteral(resourceName: "play")
        
        
        initVideoPlayer(withVideoIndex: 0)
        // playVideoFromIndex(currentIndex: currentVideoIndex!)
        
        numberLabel.text = "1/\(videoFromBackend.count)"
    }
    
    //Mark:- Methods
    func initVideoPlayer(withVideoIndex: Int) {
        lblNumberOfTimes.text = (String(videoFromBackend[withVideoIndex]["times"] as! Int)) + "X"
        lblNumberOfTimes.text = (videoFromBackend[withVideoIndex]["name"] as! String)
        let playerLayer = AVPlayerLayer(player: getPlayer(from: withVideoIndex))
        playerLayer.frame = self.videoView.bounds
        self.videoView.layer.addSublayer(playerLayer)
        currentProgressTime = Float(( self.player?.currentTime().timescale)!)
        //userdefault
        UserDefaults.standard.set(currentProgressTime, forKey: "videototaltime")
        if let val = UserDefaults.standard.value(forKey: "videototaltime") {
            print("Total Video Time ===========>",val)
            
            player!.play()
        }
    }
    
    func playVideoFromIndex(currentIndex: Int) {
        let item = AVPlayerItem(url: URL(string: videoFromBackend[currentIndex]["videoUrl"] as! String)!)
        player?.replaceCurrentItem(with: item)
        player?.play()
    }
    
    func getPlayer(from index: Int) -> AVPlayer {
        let videoURL = URL(string: videoFromBackend[currentVideoIndex!]["videoUrl"] as! String)
        player = AVPlayer(url: videoURL!)
        return player!
    }
    
    
    //  print("=============|>>>>",videoFromBackend[0]["videoUrl"])
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
     
    //Functions
    /*
     func dataOfFirebase (){
     var videoCount = videoFromBackend.count
     print("+++++>>>>>++++",videoCount)
     for i in 0...videoCount - 1 {
     let data = videoFromBackend[i]
     //  print("data ====>",data)
     videoIsPaid = videoFromBackend[i]["isPaid"] as! Bool
     videoName =   videoFromBackend[i]["name"] as! String
     videoTimes =  videoFromBackend[i]["times"] as! Int
     videofromFirebase = videoFromBackend[i]["videoUrl"] as! String
     
     print("=============|>>>>",videoFromBackend[i]["isPaid"]! as Any)
     print("=============|>>>>",videoFromBackend[i]["name"]! as Any)
     print("=============|>>>>",videoFromBackend[i]["times"]! as Any)
     print("=============|>>>>",videoFromBackend[i]["videoUrl"]! as Any)
     }*/
    //        videoIsPaid = videoFromBackend[0]["isPaid"]! as? Bool
    //        videoName = videoFromBackend[0]["name"] as? String
    //        videoTimes = (videoFromBackend[0]["times"]! as! Int)
    //        videofromFirebase = (videoFromBackend[0]["videoUrl"] as! String)
    //        print("=============|>>>>",videoFromBackend[0]["isPaid"]! as Any)
    //        print("=============|>>>>",videoFromBackend[0]["name"]! as Any)
    //        print("=============|>>>>",videoFromBackend[0]["times"]! as Any)
    //        print("=============|>>>>",videoFromBackend[0]["videoUrl"]! as Any)
    //    }
    
    func initPlayer(videoUrl: String)  {
        if let play = player {
            print("playing")
            play.play()
        } else {
            print("player allocated")
            let videoURL = URL(string: videoUrl)
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
        
        if playImage.image == #imageLiteral(resourceName: "play") {
            initPlayer(videoUrl: videoFromBackend[currentVideoIndex!]["videoUrl"] as! String)
            
            self.playImage.image = #imageLiteral(resourceName: "videoplay")
            animateProgress()

        } else {
            stopPlayer()
            self.playImage.image = #imageLiteral(resourceName: "play")
            progress.pauseAnimation()
            print(progress.angle)
            lastProgressAngle = progress.angle
        }
        
        //        if playBtnOutlet.imageView?.image == #imageLiteral(resourceName: "play"){
        //            initPlayer(videoUrl: videoFromBackend[0]["videoUrl"] as! String)
        //            self.playImage.image =  #imageLiteral(resourceName: "play")
        //            playBtnOutlet.imageView?.image =  #imageLiteral(resourceName: "play")
        //        } else {
        //            stopPlayer()
        //            self.playImage.image =  #imageLiteral(resourceName: "videoplay")
        //            playBtnOutlet.imageView?.image = #imageLiteral(resourceName: "videoplay")
        //        }
    }
    
    
    @IBAction func benifitesBtn(_ sender: Any) {
        present(StepAndBenefitsVC.instance(), animated: true, completion: nil)
    }
    
    @IBAction func crossButton(_ sender: UIButton) {
        stopPlayer()
        self.playImage.image =  #imageLiteral(resourceName: "play")
        playBtnOutlet.imageView?.image =  #imageLiteral(resourceName: "play")
        present(ExercisePopUpVC.instance(), animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        player!.pause()
        
        if currentVideoIndex != videoFromBackend.count - 1 {
            
            currentVideoIndex! += 1
            initVideoPlayer(withVideoIndex: currentVideoIndex!)
            animateProgress()
        } else {
            self.navigationController?.pushViewController(PauseVC.instance(), animated: true)
        }
    }
    
    func animateProgress()  {
        progress.animate(fromAngle: lastProgressAngle == 0.0 ? 0 : lastProgressAngle, toAngle: 360, duration: TimeInterval(currentProgressTime*60)) { completed in
            print("video progress completed:-", completed)
        }
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        stopPlayer()
        self.playImage.image =  #imageLiteral(resourceName: "play")
        playBtnOutlet.imageView?.image =  #imageLiteral(resourceName: "play")
        if !(currentVideoIndex != videoFromBackend.count - 1) {
 
            currentVideoIndex! -= 1
              initVideoPlayer(withVideoIndex: currentVideoIndex!)
            animateProgress()
        }
       // self.navigationController?.pushViewController(RoutineVC.instance(), animated: true)
    }
}
