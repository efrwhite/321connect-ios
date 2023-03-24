//
//  LoginViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//




import UIKit
import CoreData
var defaultUsername = "username"
var defaultPassword = "password"

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // login vc local variables
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    // accounts //** not coredata entity
    var accountArray = [Account]()
    var ChildArray = [Child]()
    var Childs = [String]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        self.getAccountoData
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
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
        if (!username.isEmpty && !password.isEmpty) {// if not empty check database
            // DEFAULT LOGIN
            if username == defaultUsername && password == defaultPassword {
                
                // Successful login
                // code here to segue to home screen
                
            }else{
            let request: NSFetchRequest<Account> = Account.fetchRequest()
            request.predicate = NSPredicate(format: "(userName MATCHES [cd] %@) AND passWord MATCHES [cd] %@", username, password )
                
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
                let Childrequest : NSFetchRequest<Child> = Child.fetchRequest()
                Childrequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@)", username)
                let children = (try? context.fetch(Childrequest))!
                for c in children {
                    Childs.append(c.firstName!)
                }
         }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "homescreenSegue")
        {
            let destViewController = segue.destination as! UINavigationController
            let secondViewcontroller = destViewController.viewControllers.first as! HomeScreenViewController
            secondViewcontroller.user = UsernameTextField.text!
            if Childs.first != nil{
                secondViewcontroller.login_child = Childs.first!
            }
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
        let Childrequest : NSFetchRequest<Child> = Child.fetchRequest()
     // if the username and password is not found in the database than deny access else allow them into the app
       
        do{
            accountArray = try context.fetch(request)
            ChildArray = try context.fetch(Childrequest)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}



