//
//  PottyViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit

class PottyViewController: UIViewController {
    
    var accident = ["yes","no"]
    @IBOutlet weak var PottyNotes: UITextView!
    @IBOutlet weak var PottyTableView: UITableView!
    @IBOutlet weak var PottyButton: UIButton!
    @IBOutlet weak var PottyDuration: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        PottyTableView.isHidden = true
        PottyDuration.countDownDuration
    }
   
    @IBAction func dropButtonTouched(_ sender: Any) {
        if PottyTableView.isHidden {
                animate(toggle: true)       // if hidden, show
            } else {
                animate(toggle: false)      // else hide
            }
        }
        
        func animate(toggle: Bool) {
            if toggle {
                UIView.animate(withDuration: 0.4) {
                    self.PottyTableView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.4) {
                    self.PottyTableView.isHidden = true
                }
            }
        }
    @IBAction func SaveButton(_ sender: Any) {
        let duration_potty  = PottyDuration.countDownDuration
        let Notes_Potty = PottyNotes.text
        let acci = PottyButton.currentTitle
        print("Duration:\(duration_potty), Accident: \(acci), Notes: \(Notes_Potty)")
        
        
    }
}
extension PottyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       accident.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = accident[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        PottyButton.setTitle("\(accident[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
 }
