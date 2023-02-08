//
//  ProvidersViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
// Edited By Brianna Boston
//

import Foundation
import UIKit
import CoreData

class ProvidersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var ProviderName: UITextField!
    @IBOutlet weak var PracticeName: UITextField!
    var receivedString = ""
    var user = ""
    // added
    @IBOutlet weak var specialtyType: UIPickerView!
    
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Fax: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var WebSite: UITextField!
    @IBOutlet weak var Address1: UITextField!
    @IBOutlet weak var Address2: UITextField!
    @IBOutlet weak var State: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var ZipCode: UITextField!
    
    // provider types
    let Providers = ["Pediatrician",
               "OT",
               "PT",
               "Speech",
               "Hearing",
               "Dental",
               "Cardio",
               "Ophthalmology"]
    
    var ProviderArray = [ProviderE]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        specialtyType.delegate = self
        specialtyType.dataSource = self
        receivedString = user
        
    }
    
    // intialize provider data to database
    // intialize provider data to database
       @IBAction func SaveButton(_ sender: UIButton) {
           
           // here are alerts for success or errors on view at save tapped
           if ProviderName.text!.isEmpty || PracticeName.text!.isEmpty || PhoneNumber.text!.isEmpty || Fax.text!.isEmpty || Email.text!.isEmpty || WebSite.text!.isEmpty || Address1.text!.isEmpty || Address2.text!.isEmpty || City.text!.isEmpty || State.text!.isEmpty || ZipCode.text!.isEmpty{
               let alert = UIAlertController(title: "Error", message: "Please complete all fields", preferredStyle: .alert)
               let OKAction = UIAlertAction(title: "OK", style: .default)
               alert.addAction(OKAction)
               present(alert, animated: true)
               
           } else {
               let new_provider = ProviderE(context: self.context)
               new_provider.username = receivedString
               new_provider.providerName = ProviderName.text
               new_provider.practiceName = PracticeName.text
               new_provider.phoneNumber = PhoneNumber.text
               new_provider.fax = Fax.text
               new_provider.email = Email.text
               new_provider.website = WebSite.text
               new_provider.address1 = Address1.text
               new_provider.address2 = Address2.text
               new_provider.state = State.text
               new_provider.city = City.text
               new_provider.zipCode = ZipCode.text
               self.ProviderArray.append(new_provider)
               self.SaveItems()
                   
               let alert = UIAlertController(title: "Success", message: "Data was successfully saved!", preferredStyle: .alert)
               let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                   self.navigationController?.popViewController(animated: true)
               }
               alert.addAction(OKAction)
               present(alert, animated: true)
           }
       }
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<ProviderE> = ProviderE.fetchRequest()
        do{
            ProviderArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
    
/*
 // MARK: - PickerView * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Providers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Providers[row]
    }
}
