//
//  ActivityViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//Brianna Boston

import Foundation
import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var TimePicker: UITextField!
    
    
    @IBOutlet weak var Note: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let time = Date()
        let formatter = DateFormatter()
        //myDatePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
//        formatter.locale =  Locale(identifier: "en_GB")
        formatter.locale = Locale.init(identifier: "en_GB")
//        formatter.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        formatter.dateFormat = "HH:mm"
        TimePicker.text = formatter.string(from: time)
        
        let newtime = UIDatePicker()
        newtime.datePickerMode = .time
        newtime.addTarget(self, action: #selector(ChangeTime(sender:)), for: UIControl.Event.valueChanged)
        newtime.frame.size = CGSize(width: 0, height: 250)
        TimePicker.inputView = newtime
    }
    @IBAction func SaveButton(_ sender: Any) {
        let notes = Note.text
        print("Notes: \(notes ?? "Something went wrong")")
    }
    @objc func ChangeTime(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "en_GB")
//        formatter.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        formatter.dateFormat = "HH:mm"
        TimePicker.text = formatter.string(from: sender.date)
        
        
    }
    
}
