//
//  ProvidersViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//

import Foundation
import UIKit

class ProvidersViewController: UIViewController{
    
    // db helper instance
    var db:DBHelper = DBHelper()
    
    @IBOutlet weak var providerNameTextField: UITextField!
    @IBOutlet weak var practiceNameTextField: UITextField!
    @IBOutlet weak var specialtyTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var faxTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    
    // provider address
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        providerNameTextField.delegate = self
        practiceNameTextField.delegate = self
        specialtyTextField.delegate = self
        phoneTextField.delegate = self
        faxTextField.delegate = self
        emailTextField.delegate = self
        websiteTextField.delegate = self
        
    }
    
    // intialize provider data to database
    @IBAction func saveTapped(_ sender: UIButton) {
        
        let provider = providerNameTextField.text!
        let practice = practiceNameTextField.text!
        let specialty = specialtyTextField.text!
        let phone = phoneTextField.text!
        let fax = faxTextField.text!
        let email = emailTextField.text!
        let website = websiteTextField.text!
        let address = address1TextField.text!
        let state = stateTextField.text!
        let city = cityTextField.text!
        let zip = zipCodeTextField.text!
        
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
        print("\(state)")
        print("\(city)")
        print("\(zip)")

        // use variables to input into database
//        db.ProviderInsert(providerID: /*CHANGE*/1, providerName: providerNameTextField.text!, practiceName: practiceNameTextField.text!, specialty: specialtyTextField.text!, phone: phoneTextField.text!, fax: faxTextField.text!, email: emailTextField.text!, website: websiteTextField.text!, address: address1TextField.text!, /* ? address2 ? */ state: stateTextField.text!, city: cityTextField.text!, zip: zipCodeTextField.text!)
    }
    
    // override function: touches outside of NUMBER keyboard will dismiss it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        phoneTextField.resignFirstResponder()
        
    }
}

extension ProvidersViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
