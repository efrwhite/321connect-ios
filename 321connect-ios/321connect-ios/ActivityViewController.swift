//
//  ActivityViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//Brianna Boston

import Foundation
import UIKit
import CoreData
class ActivityViewController: UIViewController {

    @IBOutlet weak var activityselection: UIButton!
    @IBOutlet weak var ActivityDuration: UIDatePicker!
    @IBOutlet weak var Note: UITextView!
    var ActivityArray = [Activity]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        setpopupbutton()
 
    }
    @IBAction func SaveButton(_ sender: Any) {
//        let notes = Note.text
//        let activity = activityselection.currentTitle
//        let ActivityDuration = ActivityDuration.countDownDuration
        let new_activity = Activity(context: self.context)
        new_activity.duration = ActivityDuration.countDownDuration
        new_activity.notes = Note.text
        new_activity.activityType = activityselection.currentTitle
        new_activity.units = "seconds"
        self.ActivityArray.append(new_activity)
        self.SaveItems()
    }
    
    func setpopupbutton(){
        let optional = {(action: UIAction) in print(action.title)}

        activityselection.menu = UIMenu(children:[
            UIAction(title:"Playing Alone",state: .on, handler: optional),
            UIAction(title:"Playing with Others", handler: optional),
            UIAction(title:"Crawling", handler: optional),
            UIAction(title:"Rolling Over", handler: optional),
            UIAction(title:"Sitting", handler: optional),
            UIAction(title:"Standing", handler: optional),
            UIAction(title:"Out for a walk", handler: optional),
            UIAction(title:"Listening to a story", handler: optional),
            UIAction(title:"Having a bath", handler: optional),
            UIAction(title:"Brushing Teeth", handler: optional)
        ])
        activityselection.showsMenuAsPrimaryAction = true
        activityselection.changesSelectionAsPrimaryAction = true
        
    }
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        
        
    }

    func loadItems(){
        let request : NSFetchRequest<Activity> = Activity.fetchRequest()
        do{
        ActivityArray = try context.fetch(request)
        } catch{
            print("Error fetching data \(error)")
        }
    }
    
}


