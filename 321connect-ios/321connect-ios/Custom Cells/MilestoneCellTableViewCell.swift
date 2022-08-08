//
//  MilestoneCellTableViewCell.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/5/22.
//

import UIKit

class MilestoneCellTableViewCell: UITableViewCell {

    @IBOutlet weak var milestoneQuestion: UILabel!
    @IBOutlet weak var milestoneDate: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
