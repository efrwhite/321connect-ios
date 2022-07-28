//
//  ProfileHeaderView.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/26/22.
//

import UIKit

class ProfileHeaderView: UITableViewCell {

    @IBOutlet weak var profileAddButton: UIButton!
    @IBOutlet weak var profileTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func profileAddTapped(_ sender: Any) {
        // Show corresponding add form for each profile
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
