//
//  SolidFeedViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/17/22.
//

import UIKit
import CoreData

class SolidFeedViewController: UIViewController {

    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var solidAmountTextField: UITextField!
    @IBOutlet weak var foodConsumedButton: UIButton!
    @IBOutlet weak var feedMeasureButton: UIButton!
    @IBOutlet weak var feedModeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var ironRadio: UIButton!
    @IBOutlet weak var multiVitaminRadio: UIButton!
    @IBOutlet weak var otherRadio: UIButton!
    @IBOutlet weak var indicateTextField: UITextField!
    var receivedString = ""
    var user = ""
    var myStr = ""
    var feedArray = [Feed]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("This is my Username Passed over to SOLID!",receivedString)
        
        // assign numeric key pad for amount text field
        solidAmountTextField.keyboardType = UIKeyboardType.numberPad
        setFoodButton()
        setMeasureButton()
        setModeButton()
        
        // text field corner/border styling
        notesTextField.layer.cornerRadius = 10
        notesTextField.clipsToBounds = true
        notesTextField.layer.borderWidth = 1
        notesTextField.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
        indicateTextField.isEnabled = false
        indicateTextField.placeholder = ""
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Button functions
    
    func setFoodButton() {
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        foodConsumedButton.menu = UIMenu(children : [
            UIAction(title : "Food", state : .on, handler: optionClosure),
            UIAction(title : "Snack", handler: optionClosure),
            UIAction(title : "Refused Food", handler: optionClosure)])
        
        foodConsumedButton.showsMenuAsPrimaryAction = true
        foodConsumedButton.changesSelectionAsPrimaryAction = true
    }
    
    func setMeasureButton() {
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        feedMeasureButton.menu = UIMenu(children : [
            UIAction(title : "cups", state : .on, handler: optionClosure),
            UIAction(title : "ounces (oz)", handler: optionClosure),
            UIAction(title : "grams (g)", handler: optionClosure),
            UIAction(title : "pieces", handler: optionClosure)])
        
        feedMeasureButton.showsMenuAsPrimaryAction = true
        feedMeasureButton.changesSelectionAsPrimaryAction = true
    }
    
    func setModeButton() {
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        feedModeButton.menu = UIMenu(children : [
            UIAction(title : "Self-fed Utensils", state : .on, handler: optionClosure),
            UIAction(title : "Other-fed Utensils", handler: optionClosure),
            UIAction(title : "G Tube", handler: optionClosure),
            UIAction(title : "NG Tube", handler: optionClosure)])
        
        feedModeButton.showsMenuAsPrimaryAction = true
        feedModeButton.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func otherTapped(_ sender: Any) {
        if otherRadio.isSelected == true {
            indicateTextField.isEnabled = true
            indicateTextField.placeholder = "Please indicate"
        } else {
            indicateTextField.isEnabled = false
            indicateTextField.placeholder = ""
        }
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
//        let notesText = notesTextField.text!
//        let foodType = foodConsumedButton.title(for: .normal)!
//        let quantity = solidAmountTextField.text! + " " + feedMeasureButton.title(for: .normal)!
//        let feedMode = feedModeButton.title(for: .normal)!
//
//        // ********** print to console ****************
//        print("NOTES: \(notesText)")
//        print("FOOD CONSUMED: \(foodType)")
//        print("QUANTITY: \(quantity)")
//        print("MODE OF EATING: \(feedMode)")
        // need to capture and print supplements
        let feeding = Feed(context: self.context)
        feeding.eatType = "Solid Eating Type"
        feeding.username = receivedString
        feeding.notes = notesTextField.text
        feeding.consumption = foodConsumedButton.title(for: .normal)
        feeding.amount = solidAmountTextField.text
        feeding.units = feedMeasureButton.title(for: .normal)
        feeding.modeOfEating = feedModeButton.title(for: .normal)
        feeding.iron = ironRadio.isEnabled
        feeding.multivitamin = multiVitaminRadio.isEnabled
        feeding.other = otherRadio.isEnabled
        feeding.otherNotes = indicateTextField.text
        
        self.feedArray.append(feeding)
        
        
        self.SaveItems()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Feed> = Feed.fetchRequest()
        do{
        feedArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
    
}
