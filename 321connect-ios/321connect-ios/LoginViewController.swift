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
    var accountArray = [Account]()
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
        if (!username.isEmpty && !password.isEmpty){// if not empty check database
//            print("Checking the strings input")
//            print(password, type(of: password)) String
//            print(username, type(of: username)) String
            let request: NSFetchRequest<Account> = Account.fetchRequest()
            request.predicate = NSPredicate(format: "(userName CONTAINS[cd] %@) AND passWord CONTAINS[cd] %@", username, password )
            request.fetchLimit = 1
            let user = (try? context.fetch(request))?.first
            let userinfo = user?.userName
            let userinfop = user?.passWord
            print("USER FETCH")
            // if username and password not found in database deny access
            if (userinfo == nil && userinfop == nil) || (userinfo != UsernameTextField.text && userinfop != PasswordTextField.text){
                // Create new Alert
                var dialogMessage = UIAlertController(title: "Error", message: "Please Create an Account using Sign Up Button", preferredStyle: .alert)
                
                // Create OK button with action handler
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                 })
                
                //Add OK button to a dialog message
                dialogMessage.addAction(ok)


                // Present Alert to
                self.present(dialogMessage, animated: true, completion: nil)
            }
           
            
            
            
        }
       


        
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "homescreenSegue")
        {
            let destViewController = segue.destination as! UINavigationController
            let secondViewcontroller = destViewController.viewControllers.first as! HomeScreenViewController
            secondViewcontroller.user = UsernameTextField.text!
        }
        
    }
    
    @IBAction func signupPressed(_ sender: Any) {
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
     // if the username and password is not found in the database than deny access else allow them into the app
    // Sign up if not found
        
        do{
        accountArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}



