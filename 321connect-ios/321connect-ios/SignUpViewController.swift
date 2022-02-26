//
//  SignUpViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 1/27/22.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController{
    
    // sign up table view
    @IBOutlet weak var signupTableView: UITableView!
    
    
    // signup vc local variables
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        
        // return to login view controller (signup cancel button)
        dismiss(animated: true, completion: nil)
    }
    
}
