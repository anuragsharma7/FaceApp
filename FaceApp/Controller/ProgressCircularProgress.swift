//
//  LoadingVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 17/12/20.
//

import UIKit

class ProgressCircularProgress: UIView {

        fileprivate var progressLayer = CAShapeLayer()
        fileprivate var tracklayer = CAShapeLayer()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            createCircularPath()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            createCircularPath()
        }
        
        var progressColor:UIColor = UIColor.green {
            didSet {
                progressLayer.strokeColor = progressColor.cgColor
            }
        }
        
        var trackColor:UIColor = UIColor.white {
            didSet {
                tracklayer.strokeColor = trackColor.cgColor
            }
        }
        
        fileprivate func createCircularPath() {
            self.backgroundColor = UIColor.clear
            self.layer.cornerRadius = self.frame.size.width/2.0

            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * Double.pi), endAngle: CGFloat(1.5 * Double.pi), clockwise: true)
            
            tracklayer.path = circlePath.cgPath
            tracklayer.fillColor = UIColor.clear.cgColor
            tracklayer.strokeColor = trackColor.cgColor
            tracklayer.lineWidth = 10.0;
            tracklayer.strokeEnd = 1.0
            layer.addSublayer(tracklayer)
            
            progressLayer.path = circlePath.cgPath
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.strokeColor = UIColor.red.cgColor
            progressLayer.lineWidth = 10.0
            progressLayer.lineCap = .round
            progressLayer.strokeEnd = 0.25
            layer.addSublayer(progressLayer)
            
        }
        
        
        
        func setProgressWithAnimation(duration: TimeInterval, value: Float) {
            
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = duration
            // Animate from 0 (no circle) to 1 (full circle)
            animation.fromValue = 0
            animation.toValue = 0.25
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            progressLayer.strokeEnd = CGFloat(value)
            progressLayer.add(animation, forKey: "animateCircle")
        }
        


    }


//    fileprivate var progressLayer = CAShapeLayer()
//    fileprivate var tracklayer = CAShapeLayer()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        createCircularPath()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        createCircularPath()
//    }
//
//    var progressColor:UIColor = UIColor.red {
//        didSet {
//            progressLayer.strokeColor = progressColor.cgColor
//        }
//    }
//
//    var trackColor:UIColor = UIColor.white {
//        didSet {
//            tracklayer.strokeColor = trackColor.cgColor
//        }
//    }
//
//    fileprivate func createCircularPath() {
//        self.backgroundColor = UIColor.clear
//        self.layer.cornerRadius = self.frame.size.width/2.0
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * Double.pi), endAngle: CGFloat(1.5 * Double.pi), clockwise: true)
//
//        tracklayer.path = circlePath.cgPath
//        tracklayer.fillColor = UIColor.clear.cgColor
//        tracklayer.strokeColor = trackColor.cgColor
//        tracklayer.lineWidth = 10.0;
//        tracklayer.strokeEnd = 1.0
//        layer.addSublayer(tracklayer)
//
//        progressLayer.path = circlePath.cgPath
//        progressLayer.fillColor = UIColor.clear.cgColor
//        progressLayer.strokeColor = progressColor.cgColor
//        progressLayer.lineWidth = 5.0
//        progressLayer.strokeEnd = 1.0
//        layer.addSublayer(progressLayer)
//
//    }
//
//    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
//
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.duration = duration
//        // Animate from 0 (no circle) to 1 (full circle)
//        animation.fromValue = 0
//        animation.toValue = 0.25
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
//        progressLayer.strokeEnd = CGFloat(value)
//        progressLayer.add(animation, forKey: "animateCircle")
//    }
//
//}
