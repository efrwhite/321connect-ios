//
//  homeViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var heightButton: UIButton!
    
    @IBOutlet weak var weightButton: UIButton!
    
    @IBOutlet weak var sleepButton: UIButton!
    
    @IBOutlet weak var moodButton: UIButton!
    
    @IBOutlet weak var medicalButton: UIButton!
    
    @IBOutlet weak var messageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
        
        /* transitions to corresponding view controller */
        
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
