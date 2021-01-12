//
//  TakeAPhotoVC.swift
//  FaceApp
//
//  Created by Divya Pathak on 23/12/20.
//

import UIKit

class TakeAPhotoVC: BaseClass {
    
//MARK:- Outlets
@IBOutlet weak var progressImgView: UIImageView!
    
@IBOutlet weak var trackProgressLabel: UILabel!
    
    
@IBOutlet weak var backBtnOutlet: UIButton!
    
@IBOutlet weak var todayBtnOutlet: UIButton!
    
    
    @IBOutlet weak var nextWorkOutBtnOutlet: UIButton!
    
    
    @IBOutlet weak var takeApictureBtnOutlet: UIButton!
    
    
    @IBOutlet weak var noThanksBtnOutlet: UIButton!
    
    
    
//MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//MARK:- IBActions
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func todayButton(_ sender: UIButton) {
    }
    
    
    @IBAction func nextWorkOutButton(_ sender: UIButton) {
    }
  
    
    @IBAction func takePictureButton(_ sender: UIButton) {
        self.showAlert()
    }
    
    
    @IBAction func noThanksButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeVc.instance(), animated: true)
    }
}

//MARK:- Image Picker
extension TakeAPhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Show alert to selected the media source type.
    private func showAlert() {

        let alert = UIAlertController(title: "Image Selection", message: "From where you want to pick this image?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    //get image from source type
    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }

    //MARK:- UIImagePickerViewDelegate.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        self.dismiss(animated: true) { [weak self] in

            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            //Setting image to your image view
            self?.progressImgView.image = image
              //UserDefaults.standard.set(image, forKey: "profileImage")
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
