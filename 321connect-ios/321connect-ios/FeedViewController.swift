import Foundation
import UIKit
import CoreData

class FeedViewController: UIViewController {
    
    @IBOutlet weak var FluidView: UIView!
    @IBOutlet weak var SolidView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var user = ""
    var userchild = ""
    var fluidViewController: FluidFeedViewController?
    var solidViewController: SolidFeedViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial view at view load
        FluidView.isHidden = false
        SolidView.isHidden = true
        
        // Get reference to child view controllers
        fluidViewController = children.first(where: { $0 is FluidFeedViewController }) as? FluidFeedViewController
        solidViewController = children.first(where: { $0 is SolidFeedViewController }) as? SolidFeedViewController
        
        // Pass user information to child view controllers
        fluidViewController?.user = user
        solidViewController?.user = user
        fluidViewController?.userchild = userchild
        solidViewController?.userchild = userchild
    }
   
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            FluidView.isHidden = false
            SolidView.isHidden = true
        } else {
            FluidView.isHidden = true
            SolidView.isHidden = false
        }
    }
}
