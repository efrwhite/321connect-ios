//
//  FluidFeedViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/17/22.
//

import UIKit

class FluidFeedViewController: UIViewController {

    @IBOutlet weak var fluidAmountTextField: UITextField!
    @IBOutlet weak var fluidMeasureButton: UIButton!
    @IBOutlet weak var fluidModeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var ironRadio: UIButton!
    @IBOutlet weak var multiVitaminRadio: UIButton!
    @IBOutlet weak var otherRadio: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
