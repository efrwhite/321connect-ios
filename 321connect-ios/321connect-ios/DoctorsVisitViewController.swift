//
//  DoctorsVisitViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 9/16/22.
//

import UIKit

class DoctorsVisitViewController: UIViewController {
    @IBOutlet weak var milestonePicker: UIPickerView!
    
    @IBOutlet weak var milestoneView: UIView!
    
    let visits = [  "Newborn",
                    "Two months",
                    "Four months",
                    "Six months",
                    "Nine months",
                    "Twelve months",
                    "Fifteen months",
                    "Eighteen months",
                    "Two years",
                    "Thirty months",
                    "Three years",
                    "Four years",
                    "Five years",
                    "Six years",
                    "Seven years",
                    "Eight years",
                    "Nine years",
                    "Ten years",
                    "Eleven years",
                    "Twelve years",
                    "Not an age-scheduled visit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        milestonePicker.dataSource = self
        milestonePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func milestonepick(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
//            NewbornViewController.show(NewbornViewController())
        }
    }
    
}

extension DoctorsVisitViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return visits.count
    }
    
}


extension DoctorsVisitViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return visits[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        switch (row) {
//        case 0:
//
//        }
    }

    
    // source: https://stackoverflow.com/questions/32166319/embed-uiviewcontroller-programmatically
    //
    
    
//    (void)addViewControllerToContainerView:(BOOL)addVC1
//    {
//    // Get storyboard
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"<name of storyboard>" bundle:[NSBundle mainBundle]];
//        UIViewController *viewController = nil;
//        if (addVC1)
//        {
//    // get viewController with identifier
//            viewController = [storyBoard instantiateViewControllerWithIdentifier:@"<View Controller 1 Identifier>"];
//        }
//        else
//        {
//            viewController = [storyBoard instantiateViewControllerWithIdentifier:@"<View Controller 2 Identifier>"];
//        }
//    // lets add it to container view
//        [viewController willMoveToParentViewController:self];
//        [self.view addSubview:viewController.view];
//        [self addChildViewController:viewController];
//        [viewController didMoveToParentViewController:self];
//    // keep reference of viewController which may be useful when you need to remove it from container view, lets consider you have a property name as containerViewController
//        self.containerViewController = viewController;
//    }
    
}
