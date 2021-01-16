//
//  HomeVCCell.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit
import SDWebImage

class HomeVCCell: UICollectionViewCell {
    
    static let identifier = "HomeVCCellID"
    
    //MARK:- Outlet
    
    @IBOutlet weak var imgBg: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnCell: UIButton!
    
    //MARK:- Variable

    var routine: Routine? {
        didSet {
            self.lblTitle.text = routine!.painPoint
            self.lblSubTitle.text = routine!.name
            self.imgBg.sd_setImage(with: URL(string: routine!.thumbImage!), placeholderImage: Placeholders.UserProfile, options: SDWebImageOptions(rawValue: 0)) { (image, error, type, url) in
            }
        }
    }
    
    var targeted: Targeted? {
        didSet {
            self.lblTitle.text = targeted!.painPoint
            self.lblSubTitle.text = targeted!.name
            self.imgBg.sd_setImage(with: URL(string: targeted!.thumbImage!), placeholderImage: Placeholders.UserProfile, options: SDWebImageOptions(rawValue: 0)) { (image, error, type, url) in
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
