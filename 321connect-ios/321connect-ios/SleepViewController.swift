//
//  SleepViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//

import Foundation
import UIKit

class SleepViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
//    @IBOutlet weak var dateTimePicker: UIDatePicker!
//    @IBOutlet weak var durationPicker: UIDatePicker!
//    @IBOutlet weak var sleepNotesView: UITextView!
//    @IBOutlet weak var reportsButton: UIButton!
//    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var sleepReportScrollView: UIScrollView!
    @IBOutlet weak var sleepReportView: UIView!
    

    lazy var sleepCycleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SleepCycleViewController")
    
    var timer = Timer()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.

        sleepReportScrollView.contentSize = sleepReportView.frame.size;

//        sleepReportScrollView.isHidden = true       // load scrollView as hidden
        
        /* *** dynamic label current time/date *** */
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        }

        @objc func tick() {
            dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        }
        /* *** source: https://www.youtube.com/watch?v=9UovPNh4Csw *** */
    
    /*
     // MARK: - Help Functions
     */
    
//    @IBAction func saveTapped(_ sender: UIButton) {
//        let notesText = sleepNotesView.text!
//        let sleepDate = dateTimePicker.date
//        let sleepTime = dateTimePicker.countDownDuration
//
//        // ********** print to console ****************
//        print("NOTES: \(notesText)")
//        print("SLEEP DATE: \(sleepDate)")
//        print("SLEEP TIME: \(sleepTime)")
//        // ********** print to console ****************
//
//    }
    
    @IBAction func sleepCycleTapped(_ sender: Any) {
        print("Sleep Cycle Button Tapped") //debug
        
        // half bottom sheet presentation. Cycle calculator VC
        if let sheet = sleepCycleVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        self.present(sleepCycleVC, animated: true, completion: nil)
    }
    
    // animation toggle helper function
//    @IBAction func reportsButtonTouched(_ sender: Any) {
//        if sleepReportScrollView.isHidden {
//            animate(toggle: true)       // if hidden, show
//        } else {
//            animate(toggle: false)      // else hide
//        }
//    }
    
//    func animate(toggle: Bool) {
//        if toggle {
//            UIView.animate(withDuration: 0.4) {
//                self.sleepReportScrollView.isHidden = false
//            }
//        } else {
//            UIView.animate(withDuration: 0.4) {
//                self.sleepReportScrollView.isHidden = true
//            }
//        }
//    }
}

