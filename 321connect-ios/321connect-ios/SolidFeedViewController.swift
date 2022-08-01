//
//  SolidFeedViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/17/22.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // assign numeric key pad for amount text field
        solidAmountTextField.keyboardType = UIKeyboardType.numberPad
        setFoodButton()
        setMeasureButton()
        setModeButton()
        
        // Do any additional setup after loading the view.
        indicateTextField.isHidden = true
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
            UIAction(title : "ounces", handler: optionClosure),
            UIAction(title : "grams", handler: optionClosure),
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
            indicateTextField.isHidden = false
        } else {
            indicateTextField.isHidden = true
        }
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        let notesText = notesTextField.text!
        let foodType = foodConsumedButton.title(for: .normal)!
        let quantity = solidAmountTextField.text! + " " + feedMeasureButton.title(for: .normal)!
        let feedMode = feedModeButton.title(for: .normal)!
        
        // ********** print to console ****************
        print("NOTES: \(notesText)")
        print("FOOD CONSUMED: \(foodType)")
        print("QUANTITY: \(quantity)")
        print("MODE OF EATING: \(feedMode)")
        // need to capture and print supplements
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
