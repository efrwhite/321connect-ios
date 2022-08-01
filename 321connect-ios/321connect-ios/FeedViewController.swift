//
//  FeedViewController.swift (parentVC to FluidVC and SolidVC)
//  321connect-ios
//
//  Created by Edward Ladia on 6/16/22.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var FluidView: UIView!
    @IBOutlet weak var SolidView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.tintColor = UIColor.white
//hereherehereherehere
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            FluidView.alpha = 1
            SolidView.alpha = 0
        } else {
            FluidView.alpha = 0
            SolidView.alpha = 1
        }
    }

}
