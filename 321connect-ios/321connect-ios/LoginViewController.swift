//
//  LoginViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//


import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    // login vc local variables
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    // accounts //** not coredata entity
    var accounts = [Account]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.getAccountoData
    }

    @IBAction func enterPressed(_ sender: Any){
    let username = UsernameTextField.text!
    let password = PasswordTextField.text!
        
        // empty user name alert
        if (username.isEmpty){
            let usernamealert = UIAlertController(title: nil, message: "Please enter username", preferredStyle: UIAlertController.Style.alert)
            usernamealert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
               self.present(usernamealert, animated: true, completion: nil)
           }
        
        // empty password alert
        if (password.isEmpty) {
               let passwordalert = UIAlertController(title: nil, message: "Please enter password", preferredStyle: UIAlertController.Style.alert)
               passwordalert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                   self.present(passwordalert, animated: true, completion: nil)
           }
        
        // verify email and password.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // manages core data stack
        let managedContext = appDelegate.persistentContainer.viewContext
        // instance of NSFRequest collects criteria needed to select group of objects
            /* entity name should be Account */
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        
        do{
            
        }
    }
    
    @IBAction func signupPressed(_ sender: Any) {
    }
}

