//
//  FifteenMonthsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class FifteenMonthsViewController: UIViewController {
    @IBOutlet weak var Q_Five: UISwitch!
    @IBOutlet weak var Q_one: UISwitch!
    @IBOutlet weak var Q_two: UISwitch!
    @IBOutlet weak var Q_three: UISwitch!
    @IBOutlet weak var Q_four: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    }
    */
    @IBAction func SwitchChangeButton(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Question 1: \(Q_one.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(Q_two.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(Q_three.isOn)")
        }
        else if sender.tag == 3{
            print("Question 4: \(Q_four.isOn)")
        }
        else if sender.tag == 4{
            print("Question 5: \(Q_Five.isOn)")
        }
    }

}
