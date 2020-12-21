//
//  RoutineCell.swift
//  FaceApp
//
//  Created by Divya Pathak on 21/12/20.
//

import UIKit

class RoutineCell: UITableViewCell {

//MARK:- Outlets
@IBOutlet weak var aboutLabel: UILabel!
@IBOutlet weak var tiltLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
