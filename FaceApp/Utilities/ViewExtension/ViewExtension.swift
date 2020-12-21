//
//  ViewExtension.swift
//  FaceApp
//
//  Created by Anurag Sharma on 22/12/20.
//

import Foundation
import UIKit

// MARK:- UIView Extension
extension UIView {
    
    static func fromNib() -> UIView {
        let nibName = String(describing: self)
        let outlets = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        var obj: UIView?
        for outlet in outlets ?? [] {
            if let out = outlet as? UIView {
                obj = out
                break
            }
        }
        return obj!
    }
    
    func addBorder(withWidth width: CGFloat, borderColor color: UIColor ) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func roundCorners(rectCorner: UIRectCorner, radius: CGFloat, withBorder borderWidth: CGFloat = 0, borderColor color: UIColor = UIColor.clear ) {
        if borderWidth == 0 {
            let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: radius, height: radius))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = bezierPath.cgPath
            self.layer.mask = shapeLayer
        } else {
            let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: radius, height: radius))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = bezierPath.cgPath
            shapeLayer.borderWidth = borderWidth
            shapeLayer.borderColor = color.cgColor
            self.layer.mask = shapeLayer
        }
    }

    
    func makeRound() {
        let radius = max(self.frame.size.width, self.frame.size.height)/2.0
        makeRound(radius: radius)
    }
    
    func makeRound(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func dropShadow(color: UIColor, offSet: CGSize, opacity: Float) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offSet
        self.layer.shadowOpacity = opacity
    }
    
    func dropShadow(color: UIColor, offSet: CGSize, opacity: Float, radius: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
    
    func makeRoundWithShadow(color: UIColor, opacity: Float) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.cornerRadius = self.frame.size.width/2.0
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = self.frame.size.width/2.0
        self.layer.shadowOpacity = opacity
    }
    
    func removeShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.0
    }
        
    
    func setSize(_ size: CGSize) {
        var frame = self.frame
        frame.size = size
        self.frame = frame
    }
    
    func setOrigin(_ point: CGPoint) {
        var frame = self.frame
        frame.origin = point
        self.frame = frame
    }
    
    
    func setWidth(_ width: CGFloat) {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }
    
    func setHeight(_ height: CGFloat) {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    func setX(_ x: CGFloat) {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    
    func setY(_ y: CGFloat) {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    
    func width() -> CGFloat {
        return self.frame.size.width
    }
    
    func height() -> CGFloat {
        return self.frame.size.height
    }
    
    func minX() -> CGFloat {
        return self.frame.origin.x
    }
    
    func minY() -> CGFloat {
        return self.frame.origin.y
    }
    
    func maxX() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    func maxY() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    func center() -> CGPoint {
        let frame = self.frame
        return CGPoint(x: frame.width/2, y: frame.height/2)
    }
    
    func placeAtCenter() {
        guard let view = self.superview else {return}
        var frame = self.frame
        frame.origin.x = (view.width() - frame.width)/2
        frame.origin.y = (view.height() - frame.height)/2
        self.frame = frame
    }
    
    func centerHorizontally() {
        guard let view = self.superview else {return}
        var frame = self.frame
        frame.origin.x = (view.width() - frame.width)/2
        self.frame = frame
    }
    
    func centerVertically() {
        guard let view = self.superview else {return}
        var frame = self.frame
        frame.origin.y = (view.height() - frame.height)/2
        self.frame = frame
    }
    
    func getLabel() -> UILabel? {
        var lbl : UILabel?
        for obj in subviews {
            if obj is UILabel {
                lbl = obj as? UILabel
                break
            }
        }
        return lbl
    }
    
    func getImageView() -> UIImageView? {
        var iv : UIImageView?
        for obj in subviews {
            if obj is UIImageView {
                iv = obj as? UIImageView
                break
            }
        }
        return iv
    }
    
    func getButton() -> UIButton? {
        var btn : UIButton?
        for obj in subviews {
            if obj is UIButton {
                btn = obj as? UIButton
                break
            }
        }
        return btn
    }
    
    func getView() -> UIView? {
        var v : UIView?
        for obj in subviews {
            if obj is UIView {
                v = obj
                break
            }
        }
        return v
    }
    
    func flip() {
        UIView.transition(with: self, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            
        }) { (finished) in
            
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
