//
//  VaccinationViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//

import Foundation
import UIKit
import CoreData

class VaccinationViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var VaccinationImage: UIImageView!
    @IBOutlet weak var NavigationBar: UINavigationItem!
  
    var vaccinationArray = [Vaccination]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Vaccination document image styling
        VaccinationImage.layer.cornerRadius = 10
        VaccinationImage.clipsToBounds = true
        VaccinationImage.layer.borderWidth = 1
        VaccinationImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // MARK: - Button functions
    
    @IBAction func AddPhotoPressed(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        //Database, might not work here not sure
        let date = NSDate()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        var dateString = dateFormatter.string(from: date as Date)
        print("DATE:",dateString)
        let image = vc
        let new_vaccination = Vaccination(context: self.context)
        new_vaccination.vacImage = image
        new_vaccination.vacSystemDate = dateString
        self.vaccinationArray.append(new_vaccination)
        self.SaveItems()
    }
    
    // MARK: - Database functions
    
    func SaveItems(){
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
    }

    func loadItems(){
        let request : NSFetchRequest<Vaccination> = Vaccination.fetchRequest()
        do{
            vaccinationArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
}

extension VaccinationViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            VaccinationImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
