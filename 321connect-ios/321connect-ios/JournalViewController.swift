//
//  JournalViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/2/22.
//

import Foundation
import UIKit

class JournalViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        /* *** dynamic label current time/date *** */
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
   
    /*
     // MARK: - Help Functions
     */
    @objc func tick() {
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    }
    /* *** source: https://www.youtube.com/watch?v=9UovPNh4Csw *** */
    
    @IBAction func saveTapped(_ sender: Any) {
        let journalTitle = titleTextField.text!
        let journalNotes = notesTextView.text!
        
        // print to console
        print("TITLE: \(journalTitle)")
        print("NOTES: \(journalNotes)")
    }
}
