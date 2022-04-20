//
//  SignUpViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 1/27/22.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    // account table iboutlet variable declaration
    @IBOutlet weak var accountTable: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    var db:DBHelper = DBHelper()
    
    var accounts:[Account] = []
    
    // signup vc local variables
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        accountTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        accountTable.delegate = self
        accountTable.dataSource = self
    
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    //***************************************************************************check here
    // output used to check input
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
               cell.textLabel?.text = "Name: " + accounts[indexPath.row].firstName + " " + accounts[indexPath.row].lastName + ", " + "User: " + String(accounts[indexPath.row].userName)

               return cell
    }
    //***************************************************************************
    
    // signup pressed confirm account information insertion
    @IBAction func signupPressed(_ sender: UIButton) {
        db.accountInsert(accountHolderID: 1, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, userName: usernameTextField.text!, passWord: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!,  phone: phoneNumberTextField.text!)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        
        // return to login view controller (signup cancel button)
        dismiss(animated: true, completion: nil)
    }
}
