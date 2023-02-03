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
    
    @IBOutlet weak var ParentPicture: UIImageView!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    var receivedString = ""
    var user = ""
    //@IBOutlet weak var SaveButton: UIButton!
    var pickerData: [String] = [String]()
    var ParentArray = [Parent]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("Parent Passed:", receivedString)
        // profile image mask and style
        ParentPicture.layer.borderWidth = 1.0
        ParentPicture.layer.masksToBounds = false
        ParentPicture.layer.borderColor = UIColor.white.cgColor
        ParentPicture.layer.cornerRadius = ParentPicture.frame.size.width/2
        ParentPicture.clipsToBounds = true
        
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
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func Save_Button(_ sender: Any) {
//        let firstName = FirstName.text
//        let lastName = LastName.text
//        let phonenumber = PhoneNumber.text
//        let username = Username.text
//        let password = Password.text
//        print("firstname: \(firstName), lastname: \(lastName), PhoneNumber: \(phonenumber), Username: \(username), password: \(password)")
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
        do{
            ParentArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}
