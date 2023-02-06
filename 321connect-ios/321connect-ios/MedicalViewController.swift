//
//  MedicalViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//

import UIKit

class MedicalViewController: UIViewController {
var user = ""
var receivedString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("Medical passed:", receivedString)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "HomeExtDV"){
            let displayVC = segue.destination as! DoctorsVisitViewController
            displayVC.user = receivedString
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
