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
    let request : NSFetchRequest<Parent> = Parent.fetchRequest()
    let account_request: NSFetchRequest<Account> = Account.fetchRequest()
    var StringArray = [String]()
    var isFirstTimeSignUp = false
    var isEditButtonPressed = false
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        if isFirstTimeSignUp {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "parentToChild"){
            let displayVC = segue.destination as! ChildView
            displayVC.user = receivedString
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
    
    @IBAction func Save_Button(_ sender: Any) {
        
        // first time sign up -> show child VC
        if isFirstTimeSignUp {
            
            /* array passed from signup [firstname, lastname, phone, pw]*/
            FirstName.text = StringArray[0]
            LastName.text = StringArray[1]
            PhoneNumber.text = StringArray[2]
            Password.text = StringArray[3]
            
            /* creates new parent */
            let new_parent = Parent(context: self.context)
            new_parent.firstName = FirstName.text
            new_parent.lastName = LastName.text
            new_parent.phoneNumber = PhoneNumber.text
            new_parent.userName = receivedString //this is pushed to child
            new_parent.password = Password.text
            
            let imageData = ParentPicture.image?.pngData()
            new_parent.parentImage = imageData
            
            /* append to new parent to parent array */
            self.ParentArray.append(new_parent)
            
            /* save parent in database */
            self.SaveItems()
            
            // Perform segue to different screen -> child
            let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.performSegue(withIdentifier: "parentToChild", sender: nil)
            }
            
            alert.addAction(OKAction)
            present(alert, animated: true)
            
            
        } else if isEditButtonPressed {
            /* edit showed this view: edit child instead*/
            do {
                guard let editParent = try context.fetch(request).first else {
                    let alert = UIAlertController(title: "Error", message: "Failed to edit child", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(OKAction)
                    present(alert, animated: true)
                    return
                }

                editParent.firstName = FirstName.text
                editParent.lastName = LastName.text
                editParent.phoneNumber = PhoneNumber.text
                editParent.userName = Username.text
                editParent.password = Password.text

                let imageData = ParentPicture.image?.pngData()
                editParent.parentImage = imageData

                try context.save()

                let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(OKAction)
                present(alert, animated: true)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }

        } else { // else pop view -> back to profiles
            
            /* creates new parent */
            let new_parent = Parent(context: self.context)
            new_parent.firstName = FirstName.text
            new_parent.lastName = LastName.text
            new_parent.phoneNumber = PhoneNumber.text
            new_parent.userName = receivedString
            new_parent.password = Password.text
            let imageData = ParentPicture.image?.pngData()
            new_parent.parentImage = imageData
            
            /* append to new parent to parent array */
            self.ParentArray.append(new_parent)
            
            /* save parent in database */
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

// MARK: - PICKERVIEW FUNCTIONS
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
                    if let imageData = parent.parentImage, let image = UIImage(data: imageData){
                        ParentPicture.image = image
                    }else{
                        ParentPicture.image = nil
                    }
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
