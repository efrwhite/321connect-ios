//
//  FluidFeedViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/17/22.
//

import UIKit

class FluidFeedViewController: UIViewController {

    @IBOutlet weak var fluidTypeTextField: UITextField!
    @IBOutlet weak var fluidAmountTextField: UITextField!
    @IBOutlet weak var fluidMeasureButton: UIButton!
    @IBOutlet weak var measureOptionsTableView: UITableView!
    @IBOutlet weak var fluidModeButton: UIButton!
    @IBOutlet weak var modeOptionsTableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var ironRadio: UIButton!
    @IBOutlet weak var multiVitaminRadio: UIButton!
    @IBOutlet weak var otherRadio: UIButton!
    
    /* fluid measuring options */
    var fluidMeasure = ["mL", "oz"]
    
    /* fluid intake modes */
    var intakeModes = ["Bottle", "Cup", "Nursing", "G tube", "NG tube"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // table views load as hidden
        measureOptionsTableView.isHidden = true
        modeOptionsTableView.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func measureButtonTouched(_ sender: UIButton) {
        /* hide all table views */
        if modeOptionsTableView.isHidden == false{
            modeOptionsTableView.isHidden = true
        }
        
        if measureOptionsTableView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    @IBAction func modeButtonTouched(_ sender: UIButton) {
        /* hide all table views */
        if measureOptionsTableView.isHidden == false{
            measureOptionsTableView.isHidden = true
        }
        
        if modeOptionsTableView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    
    func animate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.4) {
                self.measureOptionsTableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.4) {
                self.measureOptionsTableView.isHidden = true
            }
        }
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let notesText = notesTextField.text!
        let fluidType = fluidTypeTextField.text!
        let fluidMeasure = fluidAmountTextField.text! + fluidMeasureButton.title(for: .normal)!// string amount appended by fluid mode button selection
        
        //capture with radio buttons and optional 'other'
        //here
        
        // ********** print to console ****************
        print("NOTES: \(notesText)")
        print("FLUID: \(fluidType)")    // fix for required selection?
        print("AMOUNT: \(fluidMeasure)")
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
extension FluidFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if fluidMeasureButton
        fluidMeasure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fluidMeasure[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        fluidMeasureButton.setTitle("\(fluidMeasure[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
}
