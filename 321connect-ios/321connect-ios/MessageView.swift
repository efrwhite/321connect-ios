//
//  MessageView.swift
//  321connect-ios
//
//  Created by Bri Boston on 6/23/22.
//

import Foundation
import UIKit
class MessageViewController:UIViewController {
    @IBOutlet weak var NotesField: UITextView!
    
    @IBAction func SaveButton(_ sender: UIButton) {
        let notes = NotesField.text
        print("Notes:\(notes)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}
