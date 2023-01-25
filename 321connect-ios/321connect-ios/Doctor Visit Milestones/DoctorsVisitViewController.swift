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

class DoctorsVisitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // tableview height constraint constant set (arbitrary)
    @IBOutlet weak var FormTableHeight: NSLayoutConstraint!
    
    // -----> Need auto layout/ constraints for dynamically changing cell heights
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
    var pickerIdentifier: String?
    
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
        milestonePicker.dataSource = self
        milestonePicker.delegate = self
        
        ProviderType.delegate = self
        ProviderType.dataSource = self
        
        formsTableView.dataSource = self
        formsTableView.delegate = self

        formsTableView.rowHeight = UITableView.automaticDimension
        formsTableView.estimatedRowHeight = 600

        
        self.formsTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        setPopUpButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        formsTableView.estimatedRowHeight = 150
//        formsTableView.rowHeight = UITableView.automaticDimension
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
            UIAction(title:"Feet (ft)", handler: optional)])
        
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
    
//    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }

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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // NEWBORN FORM
        if pickerIdentifier == "Newborn"{
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
//                cell.formTextLabel?.text = newbornForm[indexPath.row]
                cell.textLabel!.text = newbornForm[indexPath.row]
                  
                
//                cell.formTextLabel.translatesAutoresizingMaskIntoConstraints = false

//                NSLayoutConstraint.activate([
//                    cell.formTextLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor,constant: 20),
//                    cell.formTextLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: 20),
//                    cell.formTextLabel.topAnchor.constraint(equalTo: cell.topAnchor,constant: 20),
//                    cell.formTextLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor,constant: 20)])
                
//                cell.formTextLabel.numberOfLines = 0
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = newbornForm[indexPath.row]
                cell.selectionStyle = .none

//                NSLayoutConstraint.activate([
//                    cell.questionSwitch.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
//                    cell.questionLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20)])
                return cell
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
                    let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                    cell.questionLabel.text = twoMonthForm[indexPath.row]
                    cell.selectionStyle = .none
                    return cell
                }
        }
        
        // FOUR-MONTH FORM
        if pickerIdentifier == "Four months" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
            cell.questionLabel.text = fourMonthForm[indexPath.row]
            cell.selectionStyle = .none
            return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = sixMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
        }

        // NINE-MONTH FORM
        if pickerIdentifier == "Nine months" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
            cell.questionLabel.text = nineMonthForm[indexPath.row]
            cell.selectionStyle = .none
            return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = twelveMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
        }

        // FIFTEEN-MONTH FORM
        if pickerIdentifier == "Fifteen months" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
            cell.questionLabel.text = fifteenMonthForm[indexPath.row]
            cell.selectionStyle = .none
            return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = eighteenMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = twoYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = thirtyMonthForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = threeYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = fourYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = fiveYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
        }

        // SIX-YEAR FORM
        if pickerIdentifier == "Six years" {
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = fiveYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = sevenYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = eightYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = nineYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = tenYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = elevenYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = twelveYearForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
        }

        // NO-AGE FORM
        if pickerIdentifier == "Not an age-scheduled" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! FormNotesTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        
        
        // temporary default until finish ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.selectionStyle = .none
        return cell
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


