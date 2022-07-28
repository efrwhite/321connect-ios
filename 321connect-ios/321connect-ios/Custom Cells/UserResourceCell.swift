//
//  UserResourceCell.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/23/22.
//

import UIKit

class UserResourceCell: UITableViewCell {

    @IBOutlet weak var resourceTitleLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
