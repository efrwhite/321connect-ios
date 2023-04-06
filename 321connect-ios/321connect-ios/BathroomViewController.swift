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
    var DiaperViewController: DiaperViewController?
    var PottyViewController: PottyViewController?
    var ConstipationViewController: ConstipationViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        receivedString = user
        // Get reference to child view controllers
        DiaperViewController = children.first(where: { $0 is DiaperViewController }) as? DiaperViewController
        PottyViewController = children.first(where: { $0 is PottyViewController }) as? PottyViewController
        ConstipationViewController = children.first(where: { $0 is ConstipationViewController }) as? ConstipationViewController
        
        
        // Pass user information to child view controllers
        DiaperViewController?.user = user
        PottyViewController?.user = user
        ConstipationViewController?.user = user
        DiaperViewController?.userchild = userchild
        PottyViewController?.userchild = userchild
        ConstipationViewController?.userchild = userchild
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
