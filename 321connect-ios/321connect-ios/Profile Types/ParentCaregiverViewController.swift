//
//  Parent_Caregiver_ViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/27/22.
//


import Foundation
import UIKit
import CoreData

class Parent_Caregiver_ViewController: UIViewController, UITextFieldDelegate {
    var StringArray = [String]()
    var isFirstTimeSignUp = false
    @IBOutlet weak var ParentPicture: UIImageView!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    var receivedString = ""
    var user = ""
    var edit = ""
    //@IBOutlet weak var SaveButton: UIButton!
    var pickerData: [String] = [String]()
    var ParentArray = [Parent]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("EDIT Passed: ", edit)
        print("Parent Passed:", receivedString)
        loadItems()
        print("String Array ", StringArray)
        // profile image mask and style
        ParentPicture.layer.borderWidth = 1.0
        ParentPicture.layer.masksToBounds = false
        ParentPicture.layer.borderColor = UIColor.white.cgColor
        ParentPicture.layer.cornerRadius = ParentPicture.frame.size.width/2
        ParentPicture.clipsToBounds = true
        if edit != nil{
            loadItems()
        }
       
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - BUTTON FUNCTIONS
    
    @IBAction func SelectImage(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    // Enter dismisses keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        if  isFirstTimeSignUp {
            FirstName.text = StringArray[0]
            LastName.text = StringArray[1]
            PhoneNumber.text = StringArray[2]
            Username.text = receivedString
            Password.text = StringArray[3]
            FirstName.isEnabled = false
            LastName.isEnabled = false
            PhoneNumber.isEnabled = false
            Username.isEnabled = false
            Password.isEnabled = false
        }
        
        
    }
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "parentToChild")
        {
            let displayVC = segue.destination as! ChildView
            displayVC.user = receivedString
            displayVC.isFirstTimeSignUp = true
        }
    }
    
    @IBAction func Save_Button(_ sender: Any) {
        
        // first time sign up -> show child VC
        if isFirstTimeSignUp {
//            viewWillAppear(true)
            FirstName.text = StringArray[0]
            LastName.text = StringArray[1]
            PhoneNumber.text = StringArray[2]
            Password.text = StringArray[3]
            let new_parent = Parent(context: self.context)
            new_parent.firstName = FirstName.text
            new_parent.lastName = LastName.text
            new_parent.phoneNumber = PhoneNumber.text
            new_parent.userName = receivedString //this is pushed to child
            new_parent.password = Password.text
            // new_parent.accountId = //Delegate of Account
            //Dont forget the Parent Image
            new_parent.parentImage = ParentPicture.image
            self.ParentArray.append(new_parent)
            self.SaveItems()
            
            // Perform segue to different screen -> child
            let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.performSegue(withIdentifier: "parentToChild", sender: nil)
            }
            
            alert.addAction(OKAction)
            present(alert, animated: true)
            
            // else pop view -> back to profiles
        } else {
            let new_parent = Parent(context: self.context)
            new_parent.firstName = FirstName.text
            new_parent.lastName = LastName.text
            new_parent.phoneNumber = PhoneNumber.text
            new_parent.userName = receivedString
            new_parent.password = Password.text
            // new_parent.accountId = //Delegate of Account
            //Dont forget the Parent Image
            new_parent.parentImage = ParentPicture.image
            self.ParentArray.append(new_parent)
            self.SaveItems()
            
            let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(OKAction)
            present(alert, animated: true)
        }
    }
}

extension Parent_Caregiver_ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            ParentPicture.image = image
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
    // MARK: - DATABASE FUNCTIONS
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Parent> = Parent.fetchRequest()
        let account_request: NSFetchRequest<Account> = Account.fetchRequest()
        account_request.predicate = NSPredicate(format:"userName = %@", receivedString)
        account_request.fetchLimit = 1
        let link = (try? context.fetch(account_request))!
        for re in link {
            StringArray.append(re.firstName!)
            StringArray.append(re.lastName!)
            StringArray.append(re.phone!)
            StringArray.append(re.passWord!)
        
        }
        if edit != nil{
            do{
                ParentArray = try context.fetch(request)
                request.predicate = NSPredicate(format: "(userName MATCHES [cd] %@ AND firstName MATCHES [cd] %@) ", receivedString, edit)
                let parenthistory = (try? context.fetch(request))!
                for parent in parenthistory{
                    FirstName.text = parent.firstName
                    LastName.text = parent.lastName
                    PhoneNumber.text = parent.phoneNumber
                    Username.text = parent.userName
                    Password.text = parent.password
                  
                    
                }
                
            } catch{
                print("Error fetching data \(error)")
            }
        }
        
        do{
            ParentArray = try context.fetch(request)
            
        } catch{
            print("Error fetching data \(error)")
        }
    }
}
