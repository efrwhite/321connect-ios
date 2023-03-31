//
//
//  321connect-ios
//
//  Modified/Designed by Brianna Boston
// Reminder allergies and medications are comma seperated

import CoreData
import Foundation
import UIKit
 
class ChildView: UIViewController, UITextFieldDelegate {
    
    var isFirstTimeSignUp = false
    
    @IBOutlet weak var ChildImage: UIImageView!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var Duedate: UIDatePicker!
    @IBOutlet weak var OnOff: UISegmentedControl!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Allergies: UITextField!
    @IBOutlet weak var Medications: UITextField!
    private var datePicker: UIDatePicker?
    private var datePicker2: UIDatePicker?
    @IBOutlet weak var BloodType: UIButton!
    var String_Values = [String]()
    var Date_Values = [Date]()
    var Bool_Values = [Bool]()
    var receivedString = ""
    var user = ""
    var edit = ""
    // var bloodTypes = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    //where ever U have your print statements make a object to store the information into child
    var ChildArray = [Child]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    
    override func viewDidLoad() {
     super.viewDidLoad()
        setPopupButton()
        //loadItems()
        print("EDIT Passed: ", edit)
        let edit = edit
        
        // profile image mask and style
        ChildImage.layer.borderWidth = 1.0
        ChildImage.layer.masksToBounds = false
        ChildImage.layer.borderColor = UIColor.white.cgColor
        ChildImage.layer.cornerRadius = ChildImage.frame.size.width/2
        ChildImage.clipsToBounds = true
        receivedString = user
        print("This is CHILD Passed:",receivedString)
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        // hide navigation item back button on first sign up
          if isFirstTimeSignUp{
              navigationItem.hidesBackButton = true
          }
        if edit != nil {
                loadItems()
            }
      
      /* Needed in Child's viewdidload() to prevent the back button for showing up and allowing the user to go
         back to the parent view which could cause issues! */
    }
    
    // MARK: - BUTTON FUNCTIONS --------------------
    @IBAction func Slider(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            print("Boy")
            
        }
        else if sender.selectedSegmentIndex == 1{
            print("Girl")
        }
    }
    
    @IBAction func SelectImage(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func setPopupButton(){
        let optional = {(action: UIAction) in print(action.title)}

        BloodType.menu = UIMenu(children:[
            UIAction(title:"A+",state: .on, handler: optional),
            UIAction(title:"A-", handler: optional),
            UIAction(title:"B+", handler: optional),
            UIAction(title:"B-", handler: optional),
            UIAction(title:"AB+", handler: optional),
            UIAction(title:"AB-", handler: optional),
            UIAction(title:"O+", handler: optional),
            UIAction(title:"O-", handler: optional)
            
        ])
        BloodType.showsMenuAsPrimaryAction = true
        BloodType.changesSelectionAsPrimaryAction = true
    }
    
    // Enter dismisses keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "showChildVC"){
//            let displayVC = segue.destination as! ChildView
//            displayVC.user = receivedString
//        }
//    }
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "childToHome" {
              let navController = segue.destination as! UINavigationController
              let homeScreenVC = navController.topViewController as! HomeScreenViewController
              homeScreenVC.user = receivedString
              homeScreenVC.signup_child = FirstName.text!
              
              // pass data to HomeScreenViewController if necessary
              // possible name or user (database)
          }
        
       }

   /* This code prepares the childToHome segue which is the first signin after creating
      child and directing to the home view. Here you can pass any information needed. Good Luck!*/
 
    @IBAction func SaveButton(_ sender: UIButton) {
            // here are alerts for success or errors on view at save tapped
            if FirstName.text!.isEmpty || LastName.text!.isEmpty {
                let alert = UIAlertController(title: "Error", message: "Please provide the child's name", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(OKAction)
                present(alert, animated: true)
                
            } else {
                if isFirstTimeSignUp {
//                    // Convert UIImage to Data
                    let imageData = ChildImage.image?.jpegData(compressionQuality: 1.0)

                    let new_child = Child(context: self.context)
                    new_child.username = receivedString
                    new_child.firstName = FirstName.text
                    new_child.lastName = LastName.text
                    new_child.gender = OnOff.isEnabled
                    new_child.bloodType = BloodType.currentTitle
                    new_child.dueDate = Duedate.date
                    new_child.birthday = birthday.date
                    new_child.allergies = Allergies.text
                    new_child.medication = Medications.text
                    new_child.image = imageData as? NSData as Data?
                    self.ChildArray.append(new_child)
                    self.SaveItems()
                    
                    let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                        self.performSegue(withIdentifier: "childToHome", sender: nil)
                    }
                    
                    alert.addAction(OKAction)
                    present(alert, animated: true)
                    
                } else {
//                   // Convert UIImage to Data
                    let imageData = ChildImage.image?.jpegData(compressionQuality: 1.0)


                    let new_child = Child(context: self.context)
                    new_child.username = receivedString
                    new_child.firstName = FirstName.text
                    new_child.lastName = LastName.text
                    new_child.gender = OnOff.isEnabled
                    new_child.bloodType = BloodType.currentTitle
                    new_child.dueDate = Duedate.date
                    new_child.birthday = birthday.date
                    new_child.allergies = Allergies.text
                    new_child.medication = Medications.text
                    new_child.image = imageData as? NSData as Data?
                    self.ChildArray.append(new_child)
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
    }

extension ChildView: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            ChildImage.image = image
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    func SaveItems(){
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }


    func loadItems(){
        let request : NSFetchRequest<Child> = Child.fetchRequest()
        if edit != nil{
            do{
                ChildArray = try context.fetch(request)
                request.predicate = NSPredicate(format: "(username MATCHES [cd] %@ AND firstName MATCHES [cd] %@) ", receivedString, edit)
                let childhistory = (try? context.fetch(request))!
                for info in childhistory{
                    FirstName.text = info.firstName!
                    LastName.text = info.lastName!
                    OnOff.isEnabled = info.gender
                    BloodType.setTitle(info.bloodType, for: .normal)
                    Duedate.date = info.dueDate!
                    birthday.date = info.birthday!
                    Allergies.text = info.allergies!
                    Medications.text = info.medication!
                    
                    
//                    String_Values.append(info.firstName!)
//                    String_Values.append(info.lastName!)
//                    String_Values.append(info.bloodType!)
//                    String_Values.append(info.allergies!)
//                    String_Values.append(info.medication!)
//                    Date_Values.append(info.birthday!)
//                    Date_Values.append(info.dueDate!)
//                    Bool_Values.append(info.gender)
                    
                }
            } catch{
                print("Error fetching data \(error)")
            }
        }
        else{
            do{
                ChildArray = try context.fetch(request)
            } catch{
                print("Error fetching data \(error)")
            }
        }
    }
}
