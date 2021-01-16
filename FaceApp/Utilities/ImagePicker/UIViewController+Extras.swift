//
//  UIViewController+Extras.swift
//
//  Created by Anurag on 15/11/17.
//  Copyright. All rights reserved.
//

import UIKit
///import SDWebImage

extension UIViewController {
    
    /// An alert view
    func showAlert(title: String?, message: String?) -> UIAlertController {
       return showAlert(title: title, message: message) { () in }
    }
    
    func showAlertTextField(title: String?, message: String?, buttons: [String], uiBlock: @escaping (_ alert: UIAlertController, _ textField: UITextField) -> Void, completionAction:@escaping (_ title: String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            for button in buttons {
                alert.addAction(UIAlertAction(title: button, style: .default, handler: { (action) in
                    completionAction(action.title ?? "")
                }))
            }
            
            alert.addTextField(configurationHandler: { (textField) in
                uiBlock(alert, textField)
            })
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlert(title: String?, message: String?, completionAction:@escaping () -> Void)  -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                completionAction()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        return alert
    }
    
    func showAlert(title: String?, message: String?, okTitle: String?, cancelTitle: String?, completionAction:@escaping (_ isOk: Bool) -> Void)  -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action) in
                completionAction(false)
            }))
            alert.addAction(UIAlertAction(title: okTitle, style: .default, handler: { (action) in
                completionAction(true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        return alert
    }
    
    func showAlert(title: String?, message: String?, buttons: [String], completionAction:@escaping (_ title: String) -> Void)  -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            for button in buttons {
                alert.addAction(UIAlertAction(title: button, style: .default, handler: { (action) in
                    completionAction(action.title ?? "")
                }))
            }
            self.present(alert, animated: true, completion: nil)
        }
        return alert
    }
    
    func showImageAlert(title: String?,
                        message: String?,
                        buttons:[String],
                        image: UIImage?,
                        imageUrl: String?,
                        completionAction:@escaping (_ title: String) -> Void)  -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
            imageView.backgroundColor = .clear
            imageView.image = image // Your image here...
            imageView.contentMode = .scaleAspectFit
            alert.view.addSubview(imageView)
            
            /// Load image from url if exist
            if let _urlStr = imageUrl {
                //imageView.sd_imageIndicator = AppDelegate.shared.sd_indicator()
                //imageView.sd_setImage(with: URL(string: _urlStr), placeholderImage: nil, options: SDWebImageOptions.init(rawValue: 0), completed: nil)
            }
            
            let height = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 335)
            let width = NSLayoutConstraint(item: alert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
            alert.view.addConstraint(height)
            alert.view.addConstraint(width)
            
            for button in buttons {
                alert.addAction(UIAlertAction(title: button, style: .default, handler: { (action) in
                    completionAction(action.title ?? "")
                }))
            }
            
            self.present(alert, animated: true, completion: nil)
        }
        return alert
    }
    
    
    func presentWithFadeInTransition(_ controller: UIViewController, animated: Bool) {
        controller.modalPresentationStyle = .custom
        controller.modalTransitionStyle = .crossDissolve
        self.present(controller, animated: animated, completion: nil)
    }
}
