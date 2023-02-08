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
    var userchild = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("Medical passed:", receivedString,"and Child: ", userchild)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DocVisit"){
            let displayVC = segue.destination as! DoctorsVisitViewController
            displayVC.userchild = userchild
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
