//
//  CustomTableViewCell.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/21/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var deleteButton: UIButton!
    var deleteClosure: (()->())?
//    @IBAction func deleteButtonTapped(_ sender: UIButton) {
//        deleteClosure?()
//    }
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

//    @IBAction func deleteButtonTapped(_ sender: UIButton) {
//        let alert = UIAlertController(title: "Delete Item", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
//         
//         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//         let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
//           // delete the item
//         }
//         
//         alert.addAction(cancelAction)
//         alert.addAction(deleteAction)
//         
//         self.present(alert, animated: true, completion: nil)
//    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
