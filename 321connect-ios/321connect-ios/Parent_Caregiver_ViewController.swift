//
//  Parent_Caregiver_ViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/27/22.
//


import Foundation
import UIKit

class Parent_Caregiver_ViewController: UIViewController {
    
    @IBOutlet weak var ParentPicture: UIImageView!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    //@IBOutlet weak var SaveButton: UIButton!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }
    
    @IBAction func Save_Button(_ sender: Any) {
        let firstName = FirstName.text
        let lastName = LastName.text
        let phonenumber = PhoneNumber.text
        let username = Username.text
        let password = Password.text
        print("firstname: \(firstName), lastname: \(lastName), PhoneNumber: \(phonenumber), Username: \(username), password: \(password)")
    }
}
