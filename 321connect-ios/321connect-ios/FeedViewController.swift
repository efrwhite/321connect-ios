//
//  FeedViewController.swift (parentVC to FluidVC and SolidVC)
//  321connect-ios
//
//  Created by Edward Ladia on 6/16/22.
//

import Foundation
import UIKit
import CoreData

class FeedViewController: UIViewController {
    
    @IBOutlet weak var FluidView: UIView!
    @IBOutlet weak var SolidView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
     var receivedString = ""
    var user = ""
    var userchild = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        receivedString = user
        print("FEED Passed :", receivedString, userchild)
      
        // Do any additional setup after loading the view, typically from a nib.
        // initial view at view load
        FluidView.isHidden = false
        SolidView.isHidden = true
        
    }
   
    
    
    // segmented horizontal scroll view next
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {

            FluidView.isHidden = false
            SolidView.isHidden = true
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
             let vc = storyBoard.instantiateViewController(withIdentifier: "FluidFeedViewController") as! FluidFeedViewController
            vc.user = receivedString
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
             let vc = storyBoard.instantiateViewController(withIdentifier: "SolidFeedViewController") as! SolidFeedViewController
            vc.user = receivedString
            FluidView.isHidden = true
            SolidView.isHidden = false
        }
    }
   

}
