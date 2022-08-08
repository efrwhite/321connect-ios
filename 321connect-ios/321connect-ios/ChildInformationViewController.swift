//
//
//  321connect-ios
//
//  Modified/Designed by Brianna Boston
// Reminder allergies and medications are comma seperated

 
import Foundation
import UIKit
 
class ChildView: UIViewController {
 
    @IBOutlet weak var BloodTypeTablView: UITableView!
    @IBOutlet weak var BloodTypeButton: UIButton!
    @IBOutlet weak var birthday: UIDatePicker!
  
    @IBOutlet weak var Duedate: UIDatePicker!
    
    @IBOutlet weak var OnOff: UISegmentedControl!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Allergies: UITextField!
    @IBOutlet weak var Medications: UITextField!
    
    var bloodTypes = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    @IBAction func Slider(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            print("Boy")
        }
        else if sender.selectedSegmentIndex == 1{
            print("Girl")
        }
    }
    
    
    private var datePicker: UIDatePicker?
    private var datePicker2: UIDatePicker?
    
    override func viewDidLoad() {
     super.viewDidLoad()
       
    }
   
    @IBAction func dropButtonTouched(_ sender: Any) {
            if BloodTypeTablView.isHidden {
                animate(toggle: true)       // if hidden, show
            } else {
                animate(toggle: false)      // else hide
            }
        }
        
        func animate(toggle: Bool) {
            if toggle {
                UIView.animate(withDuration: 0.4) {
                    self.BloodTypeTablView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.4) {
                    self.BloodTypeTablView.isHidden = true
                }
            }
        }
 
    @IBAction func SaveButton(_ sender: UIButton) {
        
        let FN = FirstName.text!
        let LN = LastName.text!
        let DD = Duedate.date
        let BT = BloodTypeButton.currentTitle
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
extension ChildView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bloodTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = bloodTypes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        BloodTypeButton.setTitle("\(bloodTypes[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
}
