//
//  RoutineCell2.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit
import SDWebImage

class RoutineCell2: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var marylineLabel: UILabel!
    @IBOutlet weak var imgVideo: UIImageView!
    
    var videos: [String: Any]? {
        didSet {
            marylineLabel.text = (videos!["name"] as! String)
            self.imgVideo.sd_setImage(with: URL(string: (videos!["videoUrl"] as! String)), placeholderImage: Placeholders.UserProfile, options: SDWebImageOptions.retryFailed) { (image, error, type, url) in
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:- IBActions
    @IBAction func playButton(_ sender: UIButton) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
