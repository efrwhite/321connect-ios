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

class ProvidersViewController: UIViewController{
    
    @IBOutlet weak var ProviderName: UITextField!
    @IBOutlet weak var PracticeName: UITextField!
    @IBOutlet weak var Specialty: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Fax: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var WebSite: UITextField!
    @IBOutlet weak var Address1: UITextField!
    @IBOutlet weak var Address2: UITextField!
    
    @IBOutlet weak var State: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var ZipCode: UITextField!
    var ProviderArray = [Provider]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    // intialize provider data to database
    @IBAction func SaveButton(_ sender: UIButton) {
    
        
//        let provider = ProviderName.text!
//        let practice = PracticeName.text!
//        let specialty = Specialty.text!
//        let phone = PhoneNumber.text!
//        let fax = Fax.text!
//        let email = Email.text!
//        let website = WebSite.text!
//        let address = Address1.text!
//        let address2 = Address2.text!
//        let state = State.text!
//        let city = City.text!
//        let zip = ZipCode.text!
        
        /* debug check: verify correct data catch */
//        print("NAME: \(provider)")
//        print("PRACTICE: \(practice)")
//        print("SPECIALTY: \(specialty)")
//        print("PHONE: \(phone)")
//        print("FAX: \(fax)")
//        print("EMAIL: \(email)")
//        print("WEBSITE: \(website)")
//        print("*** ADDRESS ***")
//        print("\(address)")
//        print("\(address2)")
//        print("\(state)")
//        print("\(city)")
//        print("\(zip)")
        let new_provider = Provider(context: self.context)
        new_provider.providerName = ProviderName.text
        new_provider.practiceName = PracticeName.text
        new_provider.specialty = Specialty.text
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
        
        
        
    }
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Provider> = Provider.fetchRequest()
        do{
            ProviderArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}
