//
//  DoctorsVisitViewController.swift
//  321connect-ios
//
//  NOTE: Form data will load from swift file
//        -> current
//
//  Created by Edward Ladia on 9/16/22.
//

import UIKit
import CoreData
class DoctorsVisitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // tableview height constraint constant set (arbitrary)
    @IBOutlet weak var FormTableHeight: NSLayoutConstraint!
    
    // -----> Need auto layout/ constraints for dynamically changing cell heights ~
    // -----> Need visit picker to select corresponding table view section <conditional> ~
    // -----> Need dynamically changing tableview height (disable scroll) ~
    
    @IBOutlet weak var DateOfVisit: UIDatePicker!
    @IBOutlet weak var Provider: UIPickerView!
    @IBOutlet weak var ProviderType: UIPickerView!
    @IBOutlet weak var WeightUnits: UIButton!
    @IBOutlet weak var HeightUnits: UIButton!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var HCUnits: UIButton!
    @IBOutlet weak var HeadCirc: UITextField!
    @IBOutlet weak var TempUnits: UIButton!
    @IBOutlet weak var Temp: UITextField!
    @IBOutlet weak var milestoneVisit: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    var doctorVisitArray = [DocVisit]()
    var user = ""
    var receivedString = ""
    var userchild = ""
    @IBOutlet weak var ageLabel: UILabel!
    var ChildProfile = [String]()
    var ChildProfileDate = [Date]()
    var ChildProfileImage = [UIImage]()
    var ProviderNames = [String]() //Array of Provider Names
    var childArray = [Child]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var providerArray = [ProviderE]()
    var pickerIdentifier: String?   // visit
    var providerValue: String?      // provider
    var proTypeValue: String?       // provider type
    
    @IBOutlet weak var milestonePicker: UIPickerView!
    @IBOutlet weak var formsTableView: UITableView!
    
    // sections of the same name "visits"
    let visits = [  "Newborn",
                    "Two months",
                    "Four months",
                    "Six months",
                    "Nine months",
                    "Twelve months",
                    "Fifteen months",
                    "Eighteen months",
                    "Two years",
                    "Thirty months",
                    "Three years",
                    "Four years",
                    "Five years",
                    "Six years",
                    "Seven years",
                    "Eight years",
                    "Nine years",
                    "Ten years",
                    "Eleven years",
                    "Twelve years",
                    "Not an age-scheduled"]
    
    // provider types
    let Providers = ["Pediatrician",
                     "OT",
                     "PT",
                     "Speech",
                     "Hearing",
                     "Dental",
                     "Cardio",
                     "Ophthalmology"]
    
    let newbornForm = [ "Shortly after your child was born, your child will usually have a number of tests and procedures done. The following questions are gathering that information.",
                        "Did your child have an eye exam?",
                        "If the results of the eye exam were abnormal, was your child referred to opthalmology?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child have an electrocardiogram (ECG) or did someone talk to you about their heart?",
                        "If the results of the ECG were abnormal, was your child referred to cardiology?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child complete a newborn hearing screening?",
                        "If the results of the hearing screening were abnormal, was your child referred for follow-up?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child complete a newborn metabolic screening?",
                        "If the results of the screening were abnormal, was your child referred for follow-up?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child complete a chromosomal analysis/genetic testing?",
                        "If the results of the screening were abnormal, was your child referred for follow-up?",
                        "Assessment appointment date:",
                        "Provider:"
    ]
    
    let twoMonthForm = [ "Monitoring development: Have you completed a referral for Early Intervention?",
                         "Do you have any concerns about your child's feedings?",
                         "Do you have any concerns about your child's stooling?",
                         "Do you have any concerns about your child's sleeping?",
                         "Have you been told that your child has hypotonia?",
                         "Have you been told that your child has slow feeding?",
                         "Has your child ever choked while feeding?",
                         "Has your child had recurrent or persistent respiratory symptons?",
                         "Have you been told that your child has failure to thrive?",
                         "If you have answered Yes to any of these questions, it is recommended that you have a radiographic swallowing assessment.",
                         "Assessment appointment date:",
                         "Provider:"
    ]
    
    let fourMonthForm = [ "Do you have any concerns about your child's feedings?",
                          "Do you have any concerns about your child's stooling?",
                          "Do you have any concerns about your child's sleeping?",
                          "Do you have any concerns about development? Review Early Intervention referrals."
    ]
    
    let sixMonthForm = [ "Time for your child's next eye exam (Opthalmology) visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Time for your child's next hearing visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Did your child complete a thyroid screening?",
                         "If the results of the screening were abnormal, was your child referred for follow-up?",
                         "Assessment appointment date:",
                         "Provider:",
                         "Do you have any concerns about your child's feedings?",
                         "Do you have any concerns about your child's stooling?",
                         "Do you have any concerns about your child's sleeping?",
                         "Do you have any concerns about development? Review Early Intervention referrals."
    ]
    
    let nineMonthForm = [ "Do you have any concerns about your child's feedings?",
                          "Do you have any concerns about your child's stooling?",
                          "Do you have any concerns about your child's sleeping?",
                          "Do you have any concerns about development? Review Early Intervention referrals."
    ]
    
    let twelveMonthForm = [ "Time for your child's next hearing visit.",
                            "Assessment appointment date:",
                            "Provider:",
                            "Time for your child's dental screening visit.",
                            "Assessment appointment date:",
                            "Provider:",
                            "Did your child complete a thyroid screening?",
                            "If the results of the screening were abnormal, was your child referred for follow-up?",
                            "Assessment appointment date:",
                            "Provider:",
                            "Did your child complete a hemoglobin screening?",
                            "If the results of the screening were abnormal, was your child referred for follow-up?",
                            "Assessment appointment date:",
                            "Provider:",
                            "Did your child complete a celiac screening?",
                            "If the results of the screening were abnormal, was your child referred for follow-up?",
                            "Assessment appointment date:",
                            "Provider:",
                            "Do you have any concerns about your child's feedings?",
                            "Do you have any concerns about your child's stooling?",
                            "Do you have any concerns about your child's sleeping?",
                            "Do you have any concerns about development? Review Early Intervention referrals."
    ]
    
    let fifteenMonthForm = [ "Do you have any concerns about your child's feedings?",
                             "Do you have any concerns about your child's stooling?",
                             "Do you have any concerns about your child's sleeping?",
                             "Have you scheduled a sleep study for your child?",
                             "Do you have any concerns about development? Review Early Intervention referrals."
    ]
    
    let eighteenMonthForm = [ "Time for your child's next eye exam (Opthalmology) visit.",
                              "Assessment appointment date:",
                              "Provider:",
                              "Time for your child's next hearing visit.",
                              "Assessment appointment date:",
                              "Provider:",
                              "Do you have any concerns about your child's feedings?",
                              "Do you have any concerns about your child's stooling?",
                              "Do you have any concerns about your child's sleeping?",
                              "Do you have any concerns about development? Review Early Intervention referrals."
    ]
    
    let twoYearForm = [ "Has your child been given the 23-valen pneumococcal vaccine?",
                        "Time for your child's next hearing screening visit.",
                        "Assessment appointment date:",
                        "Provider:",
                        "Time for your child's dental screening visit.",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child complete a thyroid screening?",
                        "If the results of the screening were abnormal, was your child referred for follow-up?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child complete a hemoglobin screening?",
                        "If the results of the screening were abnormal, was your child referred for follow-up?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Do you have any concerns about your child's feedings?",
                        "Do you have any concerns about your child's stooling?",
                        "Do you have any concerns about your child's sleeping?",
                        "Do you have any concerns about development? Review Early Intervention referrals."
    ]
    
    let thirtyMonthForm = [ "Time for your child's next eye exam (Opthalmology) visit.",
                            "Assessment appointment date:",
                            "Provider:",
                            "Time for your child's next hearing visit.",
                            "Assessment appointment date:",
                            "Provider:",
                            "Do you have any concerns about your child's feedings?",
                            "Do you have any concerns about your child's stooling?",
                            "Do you have any concerns about your child's sleeping?",
                            "Discuss development, preschool plan/preparations/IEP planning."
    ]
    
    let threeYearForm = [ "Time for your child's next hearing visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Time for your child's dental screening visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a thyroid screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a hemoglobin screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Discuss neck safety and symptoms to monitor for with your provider at this visit.",
                          " - Monitoring for atlantoaxial instability",
                          " - Imaging is not required unless symptoms develop",
                          "Do you have any concerns about your child's feedings?",
                          "Do you have any concerns about your child's stooling?",
                          "Have you scheduled a sleep study for your child?",
                          "Sleep study should be completed by age 4 if not yet completed.",
                          "Discuss development, preschool plan/preparations/IEP planning."
    ]
    
    let fourYearForm = [ "Time for your child's next eye exam (Opthalmology) visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Time for your child's next hearing visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Time for your child's dental screening visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Did your child complete a thyroid screening?",
                         "If the results of the screening were abnormal, was your child referred for follow-up?",
                         "Assessment appointment date:",
                         "Provider:",
                         "Did your child complete a hemoglobin screening?",
                         "If the results of the screening were abnormal, was your child referred for follow-up?",
                         "Assessment appointment date:",
                         "Provider:",
                         "Do you have any concerns about your child's feedings?",
                         "Do you have any concerns about your child's stooling?",
                         "Do you have any concerns about your child's sleeping?",
                         "Review IEP and services"
    ]
    
    let fiveYearForm = [ "Time for your child's next eye exam (Opthalmology) visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Time for your child's next hearing visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Time for your child's dental screening visit.",
                         "Assessment appointment date:",
                         "Provider:",
                         "Did your child complete a thyroid screening?",
                         "If the results of the screening were abnormal, was your child referred for follow-up?",
                         "Assessment appointment date:",
                         "Provider:",
                         "Did your child complete a hemoglobin screening?",
                         "If the results of the screening were abnormal, was your child referred for follow-up?",
                         "Assessment appointment date:",
                         "Provider:",
                         "Do you have any concerns about your child's feedings?",
                         "Do you have any concerns about your child's stooling?",
                         "Do you have any concerns about your child's sleeping?",
                         "Review IEP and services"
    ]
    
    let sixYearForm = [ "Time for your child's next eye exam (Opthalmology) visit.",
                        "Assessment appointment date:",
                        "Provider:",
                        "Time for your child's next hearing visit.",
                        "Assessment appointment date:",
                        "Provider:",
                        "Time for your child's dental screening visit.",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child complete a thyroid screening?",
                        "If the results of the screening were abnormal, was your child referred for follow-up?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Did your child complete a hemoglobin screening?",
                        "If the results of the screening were abnormal, was your child referred for follow-up?",
                        "Assessment appointment date:",
                        "Provider:",
                        "Do you have any concerns about your child's feedings?",
                        "Do you have any concerns about your child's stooling?",
                        "Do you have any concerns about your child's sleeping?",
                        "Review IEP and services"
    ]
    
    let sevenYearForm = [ "Time for your child's next hearing visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Time for your child's dental screening visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a thyroid screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a hemoglobin screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Do you have any concerns about your child's feedings?",
                          "Do you have any concerns about your child's stooling?",
                          "Do you have any concerns about your child's sleeping?",
                          "Review IEP and services"
    ]
    
    let eightYearForm = [ "Time for your child's next hearing visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Time for your child's dental screening visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a thyroid screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a hemoglobin screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Do you have any concerns about your child's feedings?",
                          "Do you have any concerns about your child's stooling?",
                          "Do you have any concerns about your child's sleeping?",
                          "Review IEP and services"
    ]
    
    let nineYearForm = [  "Time for your child's next hearing visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Time for your child's dental screening visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a thyroid screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a hemoglobin screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Do you have any concerns about your child's feedings?",
                          "Do you have any concerns about your child's stooling?",
                          "Do you have any concerns about your child's sleeping?",
                          "Review IEP and services"
    ]
    
    let tenYearForm = [   "Time for your child's next hearing visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Time for your child's dental screening visit.",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a thyroid screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Did your child complete a hemoglobin screening?",
                          "If the results of the screening were abnormal, was your child referred for follow-up?",
                          "Assessment appointment date:",
                          "Provider:",
                          "Do you have any concerns about your child's feedings?",
                          "Do you have any concerns about your child's stooling?",
                          "Do you have any concerns about your child's sleeping?",
                          "Review IEP and services"
    ]
    
    let elevenYearForm = [  "Time for your child's next hearing visit.",
                            "Assessment appointment date:",
                            "Provider:",
                            "Time for your child's dental screening visit.",
                            "Assessment appointment date:",
                            "Provider:",
                            "Did your child complete a thyroid screening?",
                            "If the results of the screening were abnormal, was your child referred for follow-up?",
                            "Assessment appointment date:",
                            "Provider:",
                            "Did your child complete a hemoglobin screening?",
                            "If the results of the screening were abnormal, was your child referred for follow-up?",
                            "Assessment appointment date:",
                            "Provider:",
                            "Do you have any concerns about your child's feedings?",
                            "Do you have any concerns about your child's stooling?",
                            "Do you have any concerns about your child's sleeping?",
                            "Review IEP and services"
    ]
    
    let twelveYearForm = [ "Time for your child's next eye exam (Opthalmology) visit.",
                           "Assessment appointment date:",
                           "Provider:",
                           "Have you arranged for the transition of care for your child?",
                           "Assessment appointment date:",
                           "Provider:",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("DV Passed:", receivedString,"and Child: ", userchild)
        milestonePicker.dataSource = self
        milestonePicker.delegate = self
        
        ProviderType.delegate = self
        ProviderType.dataSource = self
        Provider.delegate = self
        Provider.dataSource = self
        
        formsTableView.dataSource = self
        formsTableView.delegate = self
        
        // Gesture to collapse/dismiss keyboard on click outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        self.formsTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        setPopUpButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadInputViews()
        loadItems()
        //        reloadInputViews()
        let lastElement = userchild
        if lastElement != nil && lastElement != ""{
            let date = Date()
            
            // Create Date Formatter
            let dateFormatter = DateFormatter()
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            
            // Set Date Format
            dateFormatter.dateFormat = "YYYY/MM/dd"
            
            // Convert Date to String
            dateFormatter.dateFormat = "YYYY/MM/dd"
            print("CHILD passed:", lastElement)
            
            
            var Dates = ChildProfileDate.first!
            var stringdate = dateFormatter.string(from: Dates)
            let components = stringdate.components(separatedBy: "/")
            var childyear = components.first!
            
            var intchidyear = Int(childyear)
            print("CHILD YEAR",intchidyear)
            var currentyear = Int(year)
            print("CURRENT YEAR",currentyear)
            var diffyear = currentyear - intchidyear!
            var age = String(diffyear)
            
            self.ageLabel.text = age + " years old"
            print("picker, ",ProviderNames)
            
        }
    }

    /*
     // MARK: - Navigation * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     */
    
    // Dynamically adjust height of tableview for content size
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                DispatchQueue.main.async {
                    let newsize  = newvalue as! CGSize
                    self.FormTableHeight.constant = newsize.height
                }
            }
        }
    }
    //LOOK FOR CONSTANT DATABSE SELECTION OF NONE VISIT ATTRIBUTES HERE
    // Setup for unit of measure pop up button selection
    func setPopUpButton(){
        
        let optional = {(action: UIAction) in print(action.title)}
        
        //Height
        HeightUnits.menu = UIMenu(children : [
            UIAction(title:"Centimeters (cm)",state: .on, handler: optional),
            UIAction(title:"Inches (in)", handler: optional)])
        
        HeightUnits.showsMenuAsPrimaryAction = true
        HeightUnits.changesSelectionAsPrimaryAction = true
        
        //Weight
        WeightUnits.menu = UIMenu(children:[
            UIAction(title:"Ounces (oz)",state: .on, handler: optional),
            UIAction(title:"Pounds (lbs)", handler: optional)])
        
        WeightUnits.showsMenuAsPrimaryAction = true
        WeightUnits.changesSelectionAsPrimaryAction = true
        
        // Head Circumference Units
        HCUnits.menu = UIMenu(children:[
            UIAction(title:"Centimeters (cm)",state: .on, handler: optional),
            UIAction(title:"Inches (in)", handler: optional)])
        
        HCUnits.showsMenuAsPrimaryAction = true
        HCUnits.changesSelectionAsPrimaryAction = true
        
        //Temp
        TempUnits.menu = UIMenu(children:[
            UIAction(title:"Celsius °C",state: .on, handler: optional),
            UIAction(title:"Fahrenheit °F", handler: optional)])
        
        TempUnits.showsMenuAsPrimaryAction = true
        TempUnits.changesSelectionAsPrimaryAction = true
    }
    
    /*
     // MARK: - TableView * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     */

    /* * * * * * * * * * * * * * SECTION * * * * * * * * * * * * * * * * * * * * */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if pickerIdentifier == "Newborn"{
            return self.newbornForm.count
        }else if pickerIdentifier == "Two months" {
            return self.twoMonthForm.count
        }
        else if pickerIdentifier == "Four months" {
            return self.fourMonthForm.count
        }
        else if pickerIdentifier == "Six months" {
            return self.sixMonthForm.count
        }
        else if pickerIdentifier == "Nine months" {
            return self.nineMonthForm.count
        }
        else if pickerIdentifier == "Twelve months" {
            return self.twelveMonthForm.count
        }
        else if pickerIdentifier == "Fifteen months" {
            return self.fifteenMonthForm.count
        }
        else if pickerIdentifier == "Eighteen months" {
            return self.eighteenMonthForm.count
        }
        else if pickerIdentifier == "Two years" {
            return self.twoYearForm.count
        }
        else if pickerIdentifier == "Thirty months" {
            return self.thirtyMonthForm.count
        }
        else if pickerIdentifier == "Three years" {
            return self.threeYearForm.count
        }
        else if pickerIdentifier == "Four years" {
            return self.fourYearForm.count
        }
        else if pickerIdentifier == "Five years" {
            return self.fiveYearForm.count
        }
        else if pickerIdentifier == "Six years" {
            return self.sixYearForm.count
        }
        else if pickerIdentifier == "Seven years" {
            return self.sevenYearForm.count
        }
        else if pickerIdentifier == "Eight years" {
            return self.eightYearForm.count
        }
        else if pickerIdentifier == "Nine years" {
            return self.nineYearForm.count
        }
        else if pickerIdentifier == "Ten years" {
            return self.tenYearForm.count
        }
        else if pickerIdentifier == "Eleven years" {
            return self.elevenYearForm.count
        }
        else if pickerIdentifier == "Twelve years" {
            return self.twelveYearForm.count
        }
        else if pickerIdentifier == "Not an age-scheduled" {
            return 1            // single note field cell
        }
        return 0
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        let cell = tableView.cellForRow(at: indexPath)
    //        if cell?.reuseIdentifier == "FormQuestionCell" {
    //            return 250
    //        }
    //        return UITableView.automaticDimension
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // NEWBORN FORM
        if pickerIdentifier == "Newborn"{
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = newbornForm[indexPath.row]
                cell.selectionStyle = .none
                
                return cell
            }
            // this is appointment dates
            else if(indexPath.row == 3 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15 || indexPath.row == 19) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            // providers area
            else if(indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                //Questions Cell Slider
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = newbornForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // TWO-MONTH FORM
        if pickerIdentifier == "Two months"{
            if(indexPath.row == 9) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = twoMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 10) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 11) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = twoMonthForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // FOUR-MONTH FORM
        if pickerIdentifier == "Four months" {
            let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                qcell.textLabel!.text = fourMonthForm[indexPath.row]
                qcell.selectionStyle = .default
                qcell.accessoryType = .checkmark
                qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                
            return qcell
        }
        
        // SIX-MONTH FORM
        if pickerIdentifier == "Six months" {
            if(indexPath.row == 0 || indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = sixMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 9) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = sixMonthForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // NINE-MONTH FORM
        if pickerIdentifier == "Nine months" {
            let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                qcell.textLabel!.text = nineMonthForm[indexPath.row]
                qcell.selectionStyle = .default
                qcell.accessoryType = .checkmark
                qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                
            return qcell
        }
        
        // TWELVE-MONTH FORM
        if pickerIdentifier == "Twelve months" {
            if(indexPath.row == 0 || indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = twelveMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 9 || indexPath.row == 13 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = twelveMonthForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // FIFTEEN-MONTH FORM
        if pickerIdentifier == "Fifteen months" {
            let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                qcell.textLabel!.text = fifteenMonthForm[indexPath.row]
                qcell.selectionStyle = .default
                qcell.accessoryType = .checkmark
                qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                
            return qcell
        }
        
        // EIGHTEEN-MONTH FORM
        if pickerIdentifier == "Eighteen months" {
            if(indexPath.row == 0 || indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = eighteenMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = eighteenMonthForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // TWO-YEAR FORM
        if pickerIdentifier == "Two years" {
            if(indexPath.row == 1 || indexPath.row == 4) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = twoYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 9 || indexPath.row == 13) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 10 || indexPath.row == 14) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = twoYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // THIRTY-MONTH FORM
        if pickerIdentifier == "Thirty months" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 9) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = thirtyMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = thirtyMonthForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // THREE-YEAR FORM
        if pickerIdentifier == "Three years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 14 || indexPath.row == 15 || indexPath.row == 16 || indexPath.row == 20 || indexPath.row == 21) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = threeYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 9 || indexPath.row == 13) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = threeYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // FOUR-YEAR FORM
        if pickerIdentifier == "Four years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = fourYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = fourYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // FIVE-YEAR FORM
        if pickerIdentifier == "Five years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = fiveYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = fiveYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // SIX-YEAR FORM
        if pickerIdentifier == "Six years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = sixYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = sixYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // SEVEN-YEAR FORM
        if pickerIdentifier == "Seven years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = sevenYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 13 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = sevenYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        // EIGHT-YEAR FORM
        if pickerIdentifier == "Eight years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = eightYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 13 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = eightYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // NINE-YEAR FORM
        if pickerIdentifier == "Nine years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = nineYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 13 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = nineYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // TEN-YEAR FORM
        if pickerIdentifier == "Ten years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = tenYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 13 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = tenYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // ELEVEN-YEAR FORM
        if pickerIdentifier == "Eleven years" {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = elevenYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 13 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = elevenYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // TWELVE-YEAR FORM
        if pickerIdentifier == "Twelve years" {
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.textLabel!.text = twelveYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 1 || indexPath.row == 4) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 2 || indexPath.row == 5) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let qcell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath) as! FormQuestionTableViewCell
                    qcell.textLabel!.text = twelveYearForm[indexPath.row]
                    qcell.selectionStyle = .default
                    qcell.accessoryType = .checkmark
                    qcell.tintColor = UIColor(white: 0.9, alpha: 0.9)
                    
                return qcell
            }
        }
        
        // NO-AGE FORM
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! FormNotesTableViewCell
            cell.selectionStyle = .none
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect row
        tableView.deselectRow(at: indexPath, animated: true)

        // Get the selected cell
        guard let cell = tableView.cellForRow(at: indexPath) as? FormQuestionTableViewCell else {
            return
        }

        // Update the cell's checkmark and tint color
        cell.accessoryType = .checkmark
        cell.tintColor = .green
    }


    
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        let cell = tableView.cellForRow(at: indexPath) as? FormQuestionTableViewCell
//        if cell != nil {
//            // Toggle the isSelected property of the question cell to change its tint color
//            cell!.isSelected = !cell!.isSelected
//            return indexPath
//        } else {
//            return nil
//        }
//    }
    
    // MARK: - Button functions * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    // Enter dismisses keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        /* for this view: will string all data and submit on save tapped */
        let date = DateOfVisit.date
        
        // provider name
        let selectedRow0 = Provider.selectedRow(inComponent: 0)
        providerValue = Provider.delegate?.pickerView!(Provider, titleForRow: selectedRow0, forComponent: 0)
        // provider type
        let selectedRow1 = ProviderType.selectedRow(inComponent: 0)
        proTypeValue = ProviderType.delegate?.pickerView!(ProviderType, titleForRow: selectedRow1, forComponent: 0)
        
        let height = Height.text!
        let hUnits = HeightUnits.currentTitle!
        
        let weight = Weight.text!
        let wUnits = WeightUnits.currentTitle!
        
        let head = HeadCirc.text!
        let hcUnits = HCUnits.currentTitle!
        
        let temp = Temp.text!
        let tUnits = TempUnits.currentTitle!
        
        let visit = pickerIdentifier
        
        // MARK: - DataBase  * * * * * * * * * * * * * * * * * * * * * * * * * * *
        let new_DoctorV = DocVisit(context: self.context)
        new_DoctorV.username = receivedString
        new_DoctorV.childName = userchild
        new_DoctorV.dateofVisit = date
        new_DoctorV.height = height
        new_DoctorV.heightUnits = hUnits
        new_DoctorV.weight = weight
        new_DoctorV.weightUnits = wUnits
        new_DoctorV.temperature = temp
        new_DoctorV.temperatureUnits = tUnits
        
        
        
        self.doctorVisitArray.append(new_DoctorV)
        
        
        self.SaveItems()
        
        // save table view information below //
        if pickerIdentifier == "Newborn"{
            
        }
        
        let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(OKAction)
        present(alert, animated: true)
        
        // ********** print to console (debug) ****************
        print("DATE: \(date)")
        print("PROVIDER: \(selectedRow0)")      // defaulted to row number until provider name list secured
        print("SPECIALTY: \(proTypeValue!)")
        print("HEIGHT: \(height) \(String(describing: hUnits))")
        print("WEIGHT: \(weight) \(String(describing: wUnits))")
        print("HEAD: \(head) \(String(describing: hcUnits))")
        print("TEMP: \(temp) \(String(describing: tUnits))")
        
    }
    func SaveItems(){
        
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }
    
    func loadItems(){
        let Drequest : NSFetchRequest<DocVisit> = DocVisit.fetchRequest()
        let request : NSFetchRequest<Child> = Child.fetchRequest()
        let Prequest : NSFetchRequest<ProviderE> = ProviderE.fetchRequest()
        
        let lastElement = userchild
        if lastElement != nil{
            request.predicate = NSPredicate(format: "(username MATCHES [cd] %@) && (firstName MATCHES [cd] %@)", receivedString, lastElement)
            Prequest.predicate = NSPredicate(format: "(username MATCHES [cd] %@)", receivedString)
            
            let childrequest = (try? context.fetch(request))!
            let provrequest = (try? context.fetch(Prequest))!
            for i in provrequest{
                ProviderNames.append(i.providerName!)
            }
            
            
            for names in childrequest {
                ChildProfileDate.append(names.birthday!)
            }
            do{
                doctorVisitArray = try context.fetch(Drequest)
                childArray = try context.fetch(request)
            } catch{
                print("Error fetching data \(error)")
            }
        }
    }
}
/*
 // MARK: - PickerViews * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

extension DoctorsVisitViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0{
            return ProviderNames.count
        }
        if pickerView.tag == 1 {
               return Providers.count
        }
        else if pickerView.tag == 2 {
            return visits.count
        }
        else{
            return Providers.count
        }
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == ProviderType{
            return Providers[row]
        }
        if pickerView == Provider{
            return ProviderNames[row]
        }
    
        else if pickerView == milestonePicker{
            return visits[row]
        }
         return ""
    }
    
    // reload tableview data form based on picker selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == milestonePicker{
            pickerIdentifier = visits[row]
            formsTableView.reloadData()
        }
    }
}


