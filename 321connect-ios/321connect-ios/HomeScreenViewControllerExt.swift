//
//  HomeScreenViewControllerExt.swift
//  321connect-ios
//
//  Created by Edward Ladia on 11/8/21.
//

import Foundation
import UIKit

class HomeScreenViewControllerExt: UIViewController {

    // homescreen vc local variables
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var moodButton: UIButton!
    @IBOutlet weak var resourcesButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var bathroomButton: UIButton!
    @IBOutlet weak var medicalButton: UIButton!
    @IBOutlet weak var developmentButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var journalButton: UIButton!
    @IBOutlet weak var signInOutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    // all 12 buttons linked to ibaction
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // switch to case (storyboard)
        
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
