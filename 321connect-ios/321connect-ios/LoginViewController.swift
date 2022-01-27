//
//  LoginViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //login view controller variables
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func enterPressed(_ sender: Any) {
        // debugging
        print ("enter button pressed")
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        // debugging
        print ("signup button pressed")
    }
    
    
}

