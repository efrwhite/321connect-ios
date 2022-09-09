//
//  BehaviorViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/24/22.
//

import Foundation
import UIKit

class BehaviorViewController: UIViewController {

    @IBOutlet weak var notesTextView: UITextView!
//    @IBOutlet weak var moodDropButton: UIButton!
//    @IBOutlet weak var moodTableView: UITableView!

    @IBOutlet weak var moodButton: UIButton!
    @IBOutlet weak var durationPicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var historyButton: UIButton! // need history
    
    /* mood selection options */
    var moods = ["Happy",
                 "Smiling",
                 "Laughing",
                 "Playful",
                 "Cooling",
                 "Fussy",
                 "Staring",
                 "Curious",
                 "Sad",
                 "Crying",
                 "Sleepy"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setMoodButton()
//        moodTableView.isHidden = true       // load tableView as hidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Button Functions
    func setMoodButton() {
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        moodButton.menu = UIMenu(children : [
            UIAction(title : "Happy", state : .on, handler: optionClosure),
            UIAction(title : "Smiling", handler: optionClosure),
            UIAction(title : "Laughing", handler: optionClosure),
            UIAction(title : "Playful", handler: optionClosure),
            UIAction(title : "Fussy", handler: optionClosure),
            UIAction(title : "Staring", handler: optionClosure),
            UIAction(title : "Curious", handler: optionClosure),
            UIAction(title : "Sad", handler: optionClosure),
            UIAction(title : "Crying", handler: optionClosure),
            UIAction(title : "Sleepy", handler: optionClosure)])
        
        moodButton.showsMenuAsPrimaryAction = true
        moodButton.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        let notesText = notesTextView.text!
        let moodType = moodButton.title(for: .normal)!
        let duration = durationPicker.countDownDuration
        
        // ********** print to console ****************
        print("NOTES: \(notesText)")
        print("MOOD: \(moodType)")    // fix for required selection?
        print("DURATION: \(duration)")
    }
    
    // animation toggle helper function
//    @IBAction func dropButtonTouched(_ sender: Any) {
//        if moodTableView.isHidden {
//            animate(toggle: true)       // if hidden, show
//        } else {
//            animate(toggle: false)      // else hide
//        }
//    }
//
//    func animate(toggle: Bool) {
//        if toggle {
//            UIView.animate(withDuration: 0.4) {
//                self.moodTableView.isHidden = false
//            }
//        } else {
//            UIView.animate(withDuration: 0.4) {
//                self.moodTableView.isHidden = true
//            }
//        }
//    }
}

// extension for UITableView functions
//extension BehaviorViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        moods.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = moods[indexPath.row]
//
//        return cell
//    }
//
//    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
//        moodDropButton.setTitle("\(moods[indexPath.row])", for: .normal)
//        animate(toggle: false)
//    }
//}

