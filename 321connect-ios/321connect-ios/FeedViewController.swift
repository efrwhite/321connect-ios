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
    //    private func setupView() {
//        setupSegmentedControl()
//    }
//
//    private func updateView() {
//        FluidFeedVC.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
//        SolidFeedVC.view.isHidden = (segmentedControl.selectedSegmentIndex == 0)
//
//    }
//
//    private func setupSegmentedControl() {
//        segmentedControl.removeAllSegments()
//        segmentedControl.insertSegment(withTitle: "Fluid", at: 0, animated: false)
//        segmentedControl.insertSegment(withTitle: "Solid", at: 1, animated: false)
//        segmentedControl.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
//
//        segmentedControl.selectedSegmentIndex = 0
//    }
    
//    @objc func selectionDidChange(sender: UISegmentedControl) {
//        updateView()
//    }
    
//    private func addViewControllerAsChildViewController(childViewController: UIViewController) {
//        addChild(childViewController)
//
//        view.addSubview(childViewController.view)
//
//        childViewController.view.frame = view.frame /*here*/
//        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        childViewController.didMove(toParent: self)
//    }
    
    /* * * * * * * * * * * set frame * * * * * * * * * * * * * * * */
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        scrollView.frame = view.frame // find solution
//        addChildVCs()
//    }
    
//    private func addChildVCs(){
//        addChild(FluidFeedVC)
//        addChild(SolidFeedVC)
//
//        scrollView.addSubview(FluidFeedVC.view)
//        scrollView.addSubview(SolidFeedVC.view)
//
//        FluidFeedVC.view.frame = CGRect(x: 0,
//                                        y: 0,
//                                        width: scrollView.frame.size.width,
//                                        height: scrollView.frame.size.height)
//        SolidFeedVC.view.frame = CGRect(x: scrollView.frame.size.width,
//                                        y: 0,
//                                        width: scrollView.frame.size.width,
//                                        height: scrollView.frame.size.height)
//
//        FluidFeedVC.didMove(toParent: self)
//        SolidFeedVC.didMove(toParent: self)
//    }
    
//    @IBAction func switchViews (_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            scrollView.setContentOffset(.zero, animated: true)
////            FluidView.alpha = 1
////            SolidView.alpha = 0
//        }else {
//            scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
////            FluidView.alpha = 0
////            SolidView.alpha = 1
//        }
//    }
}
