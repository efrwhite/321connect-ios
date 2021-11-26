//
//  loginViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//

import UIKit

class loginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func enterPressed(_ sender: UIButton) {
        print ("button pressed")
//        self.performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        print ("button pressed")
//        self.performSegue(withIdentifier: "signupSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

