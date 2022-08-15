//
//  ActivityViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//Brianna Boston

import Foundation
import UIKit

class ActivityViewController: UIViewController {
    

    @IBOutlet weak var activityselection: UIButton!
    @IBOutlet weak var ActivityDuration: UIDatePicker!
    @IBOutlet weak var Note: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setpopupbutton()
 
    }
    @IBAction func SaveButton(_ sender: Any) {
        let notes = Note.text
        let activity = activityselection.currentTitle
        let ActivityDuration = ActivityDuration.countDownDuration
        print("Notes: \(notes ?? "Something went wrong with notes")")
        print("Duration: \(ActivityDuration )")
        print("Current Activity: \(activity)")
    }
    
    func setpopupbutton(){
        let optional = {(action: UIAction) in print(action.title)}

        activityselection.menu = UIMenu(children:[
            UIAction(title:"Playing Alone",state: .on, handler: optional),
            UIAction(title:"Playing with Others", handler: optional),
            UIAction(title:"Crawling", handler: optional),
            UIAction(title:"Rolling Over", handler: optional),
            UIAction(title:"Sitting", handler: optional),
            UIAction(title:"Standing", handler: optional),
            UIAction(title:"Out for a walk", handler: optional),
            UIAction(title:"Listening to a story", handler: optional),
            UIAction(title:"Having a bath", handler: optional),
            UIAction(title:"Brushing Teeth", handler: optional)
        ])
        activityselection.showsMenuAsPrimaryAction = true
        activityselection.changesSelectionAsPrimaryAction = true
        
    }
    
}


