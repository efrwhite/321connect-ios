//
//  DiaperViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//


import Foundation
import UIKit

class DiaperViewController: UIViewController {
    var leak = ["Yes","No"]
    @IBOutlet weak var DiaperNotes: UITextView!
    @IBOutlet weak var DiaperLeakTblView: UITableView!
    @IBOutlet weak var DiaperLeakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DiaperLeakTblView.isHidden = true
    }
    @IBAction func dropButtonTouched(_ sender: Any) {
        if DiaperLeakTblView.isHidden {
                animate(toggle: true)       // if hidden, show
            } else {
                animate(toggle: false)      // else hide
            }
        }
        
        func animate(toggle: Bool) {
            if toggle {
                UIView.animate(withDuration: 0.4) {
                    self.DiaperLeakTblView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.4) {
                    self.DiaperLeakTblView.isHidden = true
                }
            }
        }

}
extension DiaperViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       leak.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = leak[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        DiaperLeakButton.setTitle("\(leak[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
 }
