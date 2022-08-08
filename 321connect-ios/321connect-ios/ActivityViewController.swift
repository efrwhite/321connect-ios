//
//  ActivityViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//Brianna Boston

import Foundation
import UIKit

class ActivityViewController: UIViewController {
    

    @IBOutlet weak var ActivityDuration: UIDatePicker!
    @IBOutlet weak var TableActivity: UITableView!
    
    @IBOutlet weak var ActivityButton: UIButton!
    var Activities = ["Playing Alone",
    "Playing with Others",
    "Crawling",
    "Rolling Over",
    "Sitting",
    "Standing",
    "Out for a walk",
    "Listening to a story",
    "Having a bath",
    "Brushing Teeth"]
    @IBOutlet weak var Note: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    @IBAction func SaveButton(_ sender: Any) {
        let notes = Note.text
        let activity = ActivityButton.currentTitle
        let ActivityDuration = ActivityDuration.countDownDuration
        print("Notes: \(notes ?? "Something went wrong with notes")")
        print("Duration: \(ActivityDuration )")
        print("Current Activity: \(activity)")
    }
    @IBAction func dropButtonTouched(_ sender: Any) {
            if TableActivity.isHidden {
                animate(toggle: false)       // if hidden, show
            } else {
                animate(toggle: true)      // else hide
            }
        }
        
        func animate(toggle: Bool) {
            if toggle {
                UIView.animate(withDuration: 0.4) {
                    self.TableActivity.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.4) {
                    self.TableActivity.isHidden = true
                }
            }
        }
}


extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Activities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        ActivityButton.setTitle("\(Activities[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
}
