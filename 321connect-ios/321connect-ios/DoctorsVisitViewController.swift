//
//  DoctorsVisitViewController.swift
//  321connect-ios
//
//  NOTE: Form data will load from swift file
//
//  Created by Edward Ladia on 9/16/22.
//

import UIKit

class DoctorsVisitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // -----> Need auto layout/ constraints for dynamically changing cell heights
    // -----> Need visit picker to select corresponding table view section <conditional>
    // -----> Need auto layout/ constraints for dynamically changing cell heights
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
    var Providers: [String] = [String]()
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
        
        formsTableView.dataSource = self
        formsTableView.delegate = self
        
        formsTableView.rowHeight = UITableView.automaticDimension
        formsTableView.estimatedRowHeight = 80
    }
    
    
    
/*
 // MARK: - TableView * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */
    
    /* * * * * * * * * * * * * * SECTION * * * * * * * * * * * * * * * * * * * * */
    func numberOfSections(in tableView: UITableView) -> Int {
        // # 21 milestone visits -> sections (0 - 20)
        return self.visits.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.newbornForm.count
        }
        else if section == 1 {
            return self.twoMonthForm.count
        }
        else if section == 2 {
            return self.fourMonthForm.count
        }
        else if section == 3 {
            return self.sixMonthForm.count
        }
        else if section == 4 {
            return self.nineMonthForm.count
        }
        else if section == 5 {
            return self.twelveMonthForm.count
        }
        else if section == 6 {
            return self.fifteenMonthForm.count
        }
        else if section == 7 {
            return self.eighteenMonthForm.count
        }
        else if section == 8 {
            return self.twoYearForm.count
        }
        else if section == 9 {
            return self.thirtyMonthForm.count
        }
        else if section == 10 {
            return self.threeYearForm.count
        }
        else if section == 11 {
            return self.fourYearForm.count
        }
        else if section == 12 {
            return self.fiveYearForm.count
        }
        else if section == 13 {
            return self.sixYearForm.count
        }
        else if section == 14 {
            return self.sevenYearForm.count
        }
        else if section == 15 {
            return self.eightYearForm.count
        }
        else if section == 16 {
            return self.nineYearForm.count
        }
        else if section == 17 {
            return self.tenYearForm.count
        }
        else if section == 18 {
            return self.elevenYearForm.count
        }
        else if section == 19 {
            return self.twelveYearForm.count
        }
        else if section == 20 {
            return 1            // single note field cell
        }
        return 0
    }
    
    
    // ><><><><><><><><><><><>< HERE ><><><><><><><><><><>><><><><
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // NEWBORN FORM
        if indexPath.section == 0 {
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = newbornForm[indexPath.row]
                cell.textLabel?.numberOfLines = 0
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 3 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15 || indexPath.row == 19) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ApptCell", for: indexPath) as! FormAppointmentTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else if(indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 16 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell", for: indexPath) as! FormProviderTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
                cell.questionLabel.text = newbornForm[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
        }
        
        // TWO-MONTH FORM
        if indexPath.section == 1 {
            if(indexPath.row == 9) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = twoMonthForm[indexPath.row]
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
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
            cell.questionLabel.text = fourMonthForm[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        
        // SIX-MONTH FORM
        if indexPath.section == 3 {
            if(indexPath.row == 0 || indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = sixMonthForm[indexPath.row]
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
        if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
            cell.questionLabel.text = nineMonthForm[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        
        // TWELVE-MONTH FORM
        if indexPath.section == 5 {
            if(indexPath.row == 0 || indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = twelveMonthForm[indexPath.row]
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
        if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! FormQuestionTableViewCell
            cell.questionLabel.text = fifteenMonthForm[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        
        // EIGHTEEN-MONTH FORM
        if indexPath.section == 7 {
            if(indexPath.row == 0 || indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = eighteenMonthForm[indexPath.row]
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
        if indexPath.section == 8 {
            if(indexPath.row == 1 || indexPath.row == 4) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = twoYearForm[indexPath.row]
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
        if indexPath.section == 9 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 9) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = thirtyMonthForm[indexPath.row]
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
        if indexPath.section == 10 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 14 || indexPath.row == 15 || indexPath.row == 16 || indexPath.row == 20 || indexPath.row == 21) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = threeYearForm[indexPath.row]
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
        if indexPath.section == 11 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = fourYearForm[indexPath.row]
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
        if indexPath.section == 12 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = fiveYearForm[indexPath.row]
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
        if indexPath.section == 13 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 20) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = fiveYearForm[indexPath.row]
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
        if indexPath.section == 14 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = sevenYearForm[indexPath.row]
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
        if indexPath.section == 15 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = eightYearForm[indexPath.row]
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
        if indexPath.section == 16 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = nineYearForm[indexPath.row]
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
        if indexPath.section == 17 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = tenYearForm[indexPath.row]
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
        if indexPath.section == 18 {
            if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 17) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = elevenYearForm[indexPath.row]
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
        if indexPath.section == 19 {
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
                cell.formTextLabel?.text = twelveYearForm[indexPath.row]
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
        if indexPath.section == 20 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! FormNotesTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        
        // temporary default until finish ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! FormTextTableViewCell
        cell.formTextLabel?.text = newbornForm[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.visits[section] + " Provider Visit"
    }
    
}
    
/*
 // MARK: - PickerView * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

extension DoctorsVisitViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return visits.count
    }
}


extension DoctorsVisitViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return visits[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerIdentifier = visits[row]
        formsTableView.reloadData()
    }
}
