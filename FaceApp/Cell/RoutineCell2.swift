//
//  RoutineCell2.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit

class RoutineCell2: UITableViewCell {

//MARK:- Outlets
@IBOutlet weak var playBtn: UIButton!
@IBOutlet weak var marylineLabel: UILabel!
    
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
