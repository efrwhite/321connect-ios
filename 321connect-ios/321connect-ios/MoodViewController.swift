//
//  MoodViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/24/22.
//

import Foundation
import UIKit

class MoodViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var moodDropButton: UIButton!
    @IBOutlet weak var moodTableView: UITableView!
    @IBOutlet weak var durationPicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var historyButton: UIButton! // need history
    
    /* mood selection options */
    var moods = ["Happy", "Smiling", "Laughing", "Playful", "Cooling", "Fussy", "Staring", "Curious", "Sad", "Crying", "Sleepy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        moodTableView.isHidden = true       // load tableView as hidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        let notesText = notesTextView.text!
        let moodType = moodDropButton.title(for: .normal)
        let duration = durationPicker.countDownDuration
        
        // ********** print to console ****************
        print("NOTES: \(notesText)")
        print("MOOD: \(moodType ?? "N/A")")    // fix for required selection?
        print("DURATION: \(duration)")
    }
    
    // animation toggle helper function
    @IBAction func dropButtonTouched(_ sender: Any) {
        if moodTableView.isHidden {
            animate(toggle: true)       // if hidden, show
        } else {
            animate(toggle: false)      // else hide
        }
    }
    
    func animate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.4) {
                self.moodTableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.4) {
                self.moodTableView.isHidden = true
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

// extension for UITableView functions
extension MoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = moods[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        moodDropButton.setTitle("\(moods[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
}

//extension MoodViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    var pickerData = [["1", "2", "3"]]
//}
