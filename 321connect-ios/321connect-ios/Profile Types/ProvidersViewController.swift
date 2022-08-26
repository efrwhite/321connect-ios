//
//  ProvidersViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
// Edited By Brianna Boston
//

import Foundation
import UIKit

class ProvidersViewController: UIViewController{
    
    @IBOutlet weak var ProviderName: UITextField!
    @IBOutlet weak var PracticeName: UITextField!
    @IBOutlet weak var Specialty: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Fax: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var WebSite: UITextField!
    @IBOutlet weak var Address1: UITextField!
    @IBOutlet weak var Address2: UITextField!
    
    @IBOutlet weak var State: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var ZipCode: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    // intialize provider data to database
    @IBAction func SaveButton(_ sender: UIButton) {
    
        
        let provider = ProviderName.text!
        let practice = PracticeName.text!
        let specialty = Specialty.text!
        let phone = PhoneNumber.text!
        let fax = Fax.text!
        let email = Email.text!
        let website = WebSite.text!
        let address = Address1.text!
        let address2 = Address2.text!
        let state = State.text!
        let city = City.text!
        let zip = ZipCode.text!
        
        /* debug check: verify correct data catch */
        print("NAME: \(provider)")
        print("PRACTICE: \(practice)")
        print("SPECIALTY: \(specialty)")
        print("PHONE: \(phone)")
        print("FAX: \(fax)")
        print("EMAIL: \(email)")
        print("WEBSITE: \(website)")
        print("*** ADDRESS ***")
        print("\(address)")
        print("\(address2)")
        print("\(state)")
        print("\(city)")
        print("\(zip)")
    }
}
