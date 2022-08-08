//
//  NineMonthsViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//// Edited By Brianna Boston

import UIKit

class NineMonthsViewController: UIViewController {

    @IBOutlet weak var Question_Four: UISwitch!
    @IBOutlet weak var Question_Three: UISwitch!
    @IBOutlet weak var Question_Two: UISwitch!
    @IBOutlet weak var Question_one: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SwitchChangeButton(_ sender: UISwitch) {
        if sender.tag == 0{
            print("Question 1: \(Question_one.isOn)")
        }
        else if sender.tag == 1{
            print("Question 2: \(Question_Two.isOn)")
        }
        else if sender.tag == 2{
            print("Question 3: \(Question_Three.isOn)")
        }
        else if sender.tag == 3{
            print("Question 4: \(Question_Four.isOn)")
        }
    }

    /*
    // MARK: - Navigation

    */

}
