//SignUpViewController.swift
//321connect-ios
//
//  Created by Edward Ladia on 1/27/22.
//

import Foundation
import UIKit
import CoreData

class SignUpViewController: UIViewController, UITextFieldDelegate{

    var accountArray = [Account]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // signup vc local variables
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!   // formatter for phone number
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    override func viewDidLoad() {

        super.viewDidLoad()

        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }


//***************************************************************************check here

//    // output used to check input
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
//               cell.textLabel?.text = "Name: " + accounts[indexPath.row].firstName + " " + accounts[indexPath.row].lastName + ", " + "User: " + String(accounts[indexPath.row].userName)
//
//               return cell
//    }
    //***************************************************************************

    // signup pressed confirm account information insertion
    @IBAction func signupPressed(_ sender: UIButton) {

        let userFirstName = firstNameTextField.text!
        let userLastName = lastNameTextField.text!
        let username = usernameTextField.text!
        let userPhone = phoneNumberTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        
        //Database

        // if empty textfield(s) alert
        if(userFirstName.isEmpty || userLastName.isEmpty || username.isEmpty || userPhone.isEmpty || password.isEmpty || confirmPassword.isEmpty){

            let alertController = UIAlertController(title: "Incomplete Form", message: "Please complete the sign-up form", preferredStyle: .alert)

            let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
                print("cancel alert")
            })
            alertController.addAction(confirmAction)

            present(alertController, animated: true, completion: nil)

        }

        // password match alert
        if(password != confirmPassword){

            let pwAlert = UIAlertController(title: "Error", message: "Passwords do not match!", preferredStyle: .alert)

            let passwordAction = UIAlertAction(title: "OK", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
                print("cancel alert")
            })
            pwAlert.addAction(passwordAction)

            present(pwAlert, animated: true, completion: nil)
        } //else add everthing to the database for passwords
        else{
            let new_account = Account(context: self.context)
            new_account.firstName = firstNameTextField.text
            new_account.lastName = lastNameTextField.text
            new_account.userName = usernameTextField.text
            new_account.phone = phoneNumberTextField.text
            new_account.passWord = passwordTextField.text
            
            self.accountArray.append(new_account)
            self.SaveItems()
        }

        // COREDATA: code for creating table/object here
        
//        db.accountInsert(accountHolderID: 1, firstName: userFirstName, lastName: userLastName, userName: username, passWord: password, confirmPassword: confirmPassword,  phone: userPhone)


       // if successful!

            // log in -> show home page with data from [account]

            // let loginVC = storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            //present(loginVC, animated: true, completion: nil)

        

        self.performSegue(withIdentifier: "firstSignin", sender: self)
    }

    @IBAction func cancelPressed(_ sender: Any) {

        // return to login view controller (signup cancel button)
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSignin" {
            let navController = segue.destination as! UINavigationController
            let displayVC = navController.topViewController as! Parent_Caregiver_ViewController

            // pass data to HomeScreenViewController if necessary
            // possible name or user (database)
            displayVC.user = usernameTextField.text!
            displayVC.isFirstTimeSignUp = true
        }
    }
    
    // Enter dismisses keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Account> = Account.fetchRequest()
        do{
        accountArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}
