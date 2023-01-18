//
//  FluidFeedViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/17/22.
// Idea to present the Bathroom type based on where they save!?

import UIKit
import CoreData

class FluidFeedViewController: UIViewController {

    @IBOutlet weak var fluidTypeTextField: UITextField!
    @IBOutlet weak var fluidAmountTextField: UITextField!
    @IBOutlet weak var feedMeasureButton: UIButton!
    @IBOutlet weak var feedModeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var ironRadio: UIButton!
    @IBOutlet weak var multiVitaminRadio: UIButton!
    @IBOutlet weak var otherRadio: UIButton!
    @IBOutlet weak var indicateTextField: UITextField!
    var feedArray = [Feed]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.clear

        // assign numeric key pad for amount text field
        fluidAmountTextField.keyboardType = UIKeyboardType.numberPad
        setMeasureButton()
        setModeButton()
        
        // text field corner/border styling
        notesTextField.layer.cornerRadius = 10
        notesTextField.clipsToBounds = true
        notesTextField.layer.borderWidth = 1
        notesTextField.layer.borderColor = UIColor.black.cgColor
        
        // table views load as hidden
//        measureOptionsTableView.isHidden = true
//        modeOptionsTableView.isHidden = true
        
        // Do any additional setup after loading the view.
        indicateTextField.isEnabled = false
        indicateTextField.placeholder = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Button functions
    
    func setMeasureButton() {
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        feedMeasureButton.menu = UIMenu(children : [
            UIAction(title : "milliliters (ml)", state : .on, handler: optionClosure),
            UIAction(title : "ounces (oz)", handler: optionClosure)])
        
        feedMeasureButton.showsMenuAsPrimaryAction = true
        feedMeasureButton.changesSelectionAsPrimaryAction = true
    }
    
    func setModeButton() {
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
        
        feedModeButton.menu = UIMenu(children : [
            UIAction(title : "Bottle", state : .on, handler: optionClosure),
            UIAction(title : "Cup", handler: optionClosure),
            UIAction(title : "Nursing", handler: optionClosure),
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
    
//    @IBAction func measureButtonTouched(_ sender: UIButton) {
//        /* hide all table views */
//        if modeOptionsTableView.isHidden == false{
//            modeOptionsTableView.isHidden = true
//        }
//
//        if measureOptionsTableView.isHidden {
//            animate(toggle: true)
//        } else {
//            animate(toggle: false)
//        }
//    }
//
//    @IBAction func modeButtonTouched(_ sender: UIButton) {
//        /* hide all table views */
//        if measureOptionsTableView.isHidden == false{
//            measureOptionsTableView.isHidden = true
//        }
//
//        if modeOptionsTableView.isHidden {
//            animate(toggle: true)
//        } else {
//            animate(toggle: false)
//        }
//    }
    
    
//    func animate(toggle: Bool) {
//        if toggle {
//            UIView.animate(withDuration: 0.4) {
//                self.measureOptionsTableView.isHidden = false
//            }
//        } else {
//            UIView.animate(withDuration: 0.4) {
//                self.measureOptionsTableView.isHidden = true
//            }
//        }
//    }
    
    @IBAction func saveTapped(_ sender: Any) {
//        let notesText = notesTextField.text!
//        let fluidType = fluidTypeTextField.text!
//        let fluidMeasure = fluidAmountTextField.text! + " " + feedMeasureButton.title(for: .normal)!// string amount appended by fluid mode button selection
//        let feedMode = feedModeButton.title(for: .normal)!
        //capture with radio buttons and optional 'other'

        
        // ********** print to console ****************
//        print("NOTES: \(notesText)")
//        print("FLUID: \(fluidType)")    // fix for required selection?
//        print("AMOUNT: \(fluidMeasure)")
//        print("MODE OF FEED: \(feedMode)")
        
        
        //############### Capture to database ##################
        let feeding = Feed(context: self.context)
        feeding.eatType = "Fluid Eating Type"
        feeding.notes = notesTextField.text
        feeding.consumption = fluidTypeTextField.text
        feeding.amount = fluidAmountTextField.text
        feeding.units = feedMeasureButton.title(for: .normal)
        feeding.modeOfEating = feedModeButton.title(for: .normal)
        feeding.iron = ironRadio.isEnabled
        feeding.multivitamin = multiVitaminRadio.isEnabled
        feeding.other = otherRadio.isEnabled
        feeding.otherNotes = indicateTextField.text
        
        
        self.feedArray.append(feeding)
        
        
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
        let request : NSFetchRequest<Feed> = Feed.fetchRequest()
        do{
        feedArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
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

// extension for UITableView functions
//extension FluidFeedViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        if fluidMeasureButton
//        fluidMeasure.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = fluidMeasure[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
//        fluidMeasureButton.setTitle("\(fluidMeasure[indexPath.row])", for: .normal)
//        animate(toggle: false)
//    }
//}
