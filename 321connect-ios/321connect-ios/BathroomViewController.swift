//
//  BathroomViewController.swift
//  321connect-ios
//
//  Created by Bri Boston on 7/16/22.
//

import Foundation
import UIKit
class BathroomViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SegmentView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{

            view1.alpha = 1
            view2.alpha = 0
            view3.alpha = 0
              }
        else if sender.selectedSegmentIndex == 1{

                  view1.alpha = 0
                  view2.alpha = 1
                  view3.alpha = 0
              }
        else {
            
            view1.alpha = 0
            view2.alpha = 0
            view3.alpha = 1
            
            
        }
    }

}
