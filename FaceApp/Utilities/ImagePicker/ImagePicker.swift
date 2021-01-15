//
//  ImagePicker.swift
//
//  Created by Vakul Saini on 18/04/19.
//  Copyright © 2019 enAct eServices. All rights reserved.
//

import UIKit
import AssetsLibrary
import AVFoundation

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    static let PhotoGallery = "Photo Gallery"
    static let Camera = "Camera"
    static let Cancel = "Cancel"
    
    typealias ImagePickerDelegate = (_ image: UIImage?) -> Void
    typealias ImagePickerNoPictureDelegate = () -> Void
    var allowsEditing: Bool = true
    var onlyFrontCamera: Bool = false
    
    var myBlock: ImagePickerDelegate?
    var myController: UIViewController?
    fileprivate let imagePicker: UIImagePickerController = UIImagePickerController()


    func show(inController controller: UIViewController, title: String, completionBlock block: @escaping ImagePickerDelegate) {
        let alert = alertFor(controller: controller, completionBlock: block, style: .alert)
        alert.title = title
        controller.present(alert, animated: true) {
            
        }
    }
    
    /// By using this method imagePicker will show as alert not as popover
    func show(inController controller: UIViewController, completionBlock block: @escaping ImagePickerDelegate) {
        let alert = alertFor(controller: controller, completionBlock: block, style: .alert)
        controller.present(alert, animated: true) {
            
        }
    }
    
    
    func show(inController controller: UIViewController, from source: UIView, completionBlock block: @escaping ImagePickerDelegate) {
        
        let alert = alertFor(controller: controller, completionBlock: block, style: .actionSheet)
        
        // Present it
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = source
        }
        controller.present(alert, animated: true) {
            
        }
    }
    
    func show(inController controller: UIViewController, from source: UIView, sourceRect: CGRect, completionBlock block: @escaping ImagePickerDelegate) {
        
        let alert = alertFor(controller: controller, completionBlock: block, style: .actionSheet)
        alert.modalPresentationStyle = UIModalPresentationStyle.popover

        // Present it
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = source
            popoverController.sourceRect = sourceRect
            popoverController.permittedArrowDirections = .init(rawValue: 0)
        }
        
        controller.present(alert, animated: true) {
            
        }
    }

    fileprivate func alertFor(controller: UIViewController, completionBlock block: @escaping ImagePickerDelegate, style: UIAlertController.Style) -> UIAlertController {
        
        self.myBlock = block
        self.myController = controller
        
        let heading = "Choose Photo:"
        
        // Make UIAlertController with ActionSheet style
        let alert = UIAlertController(title: heading, message: "", preferredStyle: style)
        
        // Add actions
        // PhotoGallery
        let alertActionGallery = UIAlertAction(title: ImagePicker.PhotoGallery, style: .default, handler: { action in
            self.showImagePickerOfType(ImagePicker.PhotoGallery)
            alert.dismiss(animated: true)
        })
        
        alert.addAction(alertActionGallery)
        
        // Camera
        let alertActionCamera = UIAlertAction(title: ImagePicker.Camera, style: .default, handler: { action in
            self.showImagePickerOfType(ImagePicker.Camera)
            alert.dismiss(animated: true)
        })
        
        alert.addAction(alertActionCamera)
        
        
        // Cancel
        let alertActionCancel = UIAlertAction(title: ImagePicker.Cancel, style: .default, handler: { action in
            if let b = self.myBlock  {
                b(nil)
            }
            alert.dismiss(animated: true)
        })
        
        alert.addAction(alertActionCancel)
        
        return alert
    }
    
    func showImagePickerOfType(_ type: String?) {
        
        let status = canAccessCamera()
        if status.canAccess {
            // We have camera permission
            self.openImageGallery(type)
        }
        else if status.status == .notDetermined {
            // User haven't taken any action yet
            askForCameraPermission { (granted) in
                if granted {
                    DispatchQueue.main.async {
                        self.openImageGallery(type)
                    }
                }
            }
        }
        else {
            // We don't have camera permission
            if let settingsUrl = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(settingsUrl) {
                _ = self.myController?.showAlert(title: "\"\(AppName)\" Would Like to Access the Camera", message: "Camera is needed to capture your profile photo.", buttons: ["Cancel", "Open Settings"], completionAction: { (title) in
                    if title != "Cancel" {
                        UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
                    }
                })
            }
            else {
                // Can not open settings url, so just show a simple alert
                _ = self.myController?.showAlert(title: "\"\(AppName)\" Would Like to Access the Camera", message: status.message)
            }
        }
    }
    
    func openImageGallery(_ type: String?) {
        
        let sourceType: UIImagePickerController.SourceType = (type == ImagePicker.PhotoGallery) ? .photoLibrary : .camera
        if !UIImagePickerController.isSourceTypeAvailable(sourceType) {
            _ = myController?.showAlert(title: "", message: "Device doesn't support this feature.")
            return
        }
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = allowsEditing
        imagePicker.sourceType = sourceType
        
        if type == ImagePicker.Camera {
            if onlyFrontCamera {
                self.imagePicker.cameraDevice = .front
            }
            else {
                self.imagePicker.cameraDevice = .rear
            }
        }
        
        myController?.present(imagePicker, animated: true) {
            
        }
    }
    
    fileprivate func imageResize(_ sourceImage: UIImage?, scaleToWidth: CGFloat) -> UIImage? {
        
        let oldWidth: CGFloat? = sourceImage?.size.width
        let scaleFactor: CGFloat = scaleToWidth / (oldWidth ?? 0.0)
        
        let newHeight: CGFloat = (sourceImage?.size.height ?? 0.0) * scaleFactor
        let newWidth: CGFloat = (oldWidth ?? 0.0) * scaleFactor
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        sourceImage?.draw(in: CGRect(x: 0.0, y: 0.0, width: newWidth, height: newHeight))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // MARK: - ImagePicker Delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if let b = myBlock  {
            b(nil)
        }
        imagePicker.dismiss(animated: true) { }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let b = self.myBlock, let image = (imagePicker.allowsEditing ? info[UIImagePickerController.InfoKey.editedImage] : info[UIImagePickerController.InfoKey.originalImage]) as? UIImage, let finalImage = imageResize(image, scaleToWidth: 600.0) {
            b(finalImage)
        }
        imagePicker.dismiss(animated: true) { }
    }
    
    // MARK:- Check for the camera permissions
    func canAccessCamera() -> (message: String, canAccess: Bool, status: AVAuthorizationStatus) {
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)

        let message = "Camera is needed to capture your profile photo.\nGo to settings -> `Hourful` and enable the Camera."
        
        switch cameraAuthorizationStatus {
            case .denied: return (message, false, cameraAuthorizationStatus);
            case .authorized: return ("", true, cameraAuthorizationStatus)
            case .restricted: return (message, false, cameraAuthorizationStatus)
            case .notDetermined: return (message, false, cameraAuthorizationStatus)
            
            @unknown default:
                return (message, false, .notDetermined);
            }
    }
    
    func askForCameraPermission(_ completion: @escaping (_ success: Bool) -> Void) {
        // Prompting user for the permission to use the camera.
        let cameraMediaType = AVMediaType.video
        AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
            completion(granted)
        }
    }
}

