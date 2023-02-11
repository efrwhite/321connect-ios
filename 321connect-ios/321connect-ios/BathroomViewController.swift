//
//  BathroomViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit
import CoreData
class BathroomViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    var receivedString = ""
    var user = ""
    var userchild = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        
        //load initial: view 1
        view1.alpha = 1
        view2.alpha = 0
        view3.alpha = 0
    }
    
    @IBAction func SegmentView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view1.alpha = 1
            view2.alpha = 0
            view3.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            view1.alpha = 0
            view2.alpha = 1
            view3.alpha = 0
        } else {
            view1.alpha = 0
            view2.alpha = 0
            view3.alpha = 1
        }
    }
}
