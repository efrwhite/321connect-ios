//
//
//  321connect-ios
//
//  Modified/Designed by Brianna Boston
// Reminder allergies and medications are comma seperated

 
import Foundation
import UIKit
 
class ChildView: UIViewController {
 
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
    // var bloodTypes = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    //where ever U have your print statements make a object to store the information into child
    
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
    
    override func viewDidLoad() {
     super.viewDidLoad()
        setPopupButton()
       
    }
   
   
 
    @IBAction func SaveButton(_ sender: UIButton) {
        
        let FN = FirstName.text!
        let LN = LastName.text!
        let DD = Duedate.date
        let BT = BloodType.currentTitle
        let BD = birthday.date
        let Al = Allergies.text!
        let MD = Medications.text!
       
        // this will need to be put in a if else statement
        let boyslider = OnOff.titleForSegment(at: 0)
        let girlslider = OnOff.titleForSegment(at: 1)
    
        
        
        print("This is the firstName: \(FN)")
        print("This is the firstName: \(LN)")
        print("This is the Birthdate: \(BD)")
        print("This is the DueDate: \(DD)")
        print("This is the Allergies: \(Al)")
        print("This is the Medications: \(MD)")
        print("BloodType: \(BT)")
        print("This is the slider for boy: \(boyslider)")
        print("This is the slider for girl: \(girlslider)")
      
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
    
}
