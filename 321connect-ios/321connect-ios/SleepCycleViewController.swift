//
//  SleepCycleViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 8/2/22.
//

import UIKit
import CoreData

class SleepCycleViewController: UIViewController {
    var SleepArray = [Sleep]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dateFormatter = DateFormatter()

    @IBOutlet weak var SleepCycleDate: UIDatePicker!
    @IBOutlet weak var hourlable: UILabel!
    @IBOutlet weak var minlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadItems()
       
        

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
    @IBAction func calculateTotalSleep(_ sender: UIButton) {
        let sleepDateconfirm = SleepCycleDate.date
        dateFormatter.dateFormat = "MM/dd/YY"
        let stringsleepDate = dateFormatter.string(from:sleepDateconfirm)
        print("THIS IS MY SLEEP DATA CYCLE", stringsleepDate)
        
        let request: NSFetchRequest<Sleep> = Sleep.fetchRequest()
        request.predicate = NSPredicate(format: "(sleepDate CONTAINS[cd] %@) AND (duration > %i)", stringsleepDate, 0)
        request.fetchLimit = 1
        let date = (try? context.fetch(request))?.first
        let newd = date?.duration
        print("This is duration associated with \(stringsleepDate) : ",newd)
        let intdate =  Int(newd!)
        print("This is duration as an Integer: ", intdate)
        let minutes = round(Double(intdate/60))
        let hours = round(Double(minutes/60))
        print("Number of Minutes:", minutes)
        print("Number of hours:", hours)
        minlabel.text = String(minutes)
        hourlable.text = String(hours)
        


        do{
        SleepArray = try context.fetch(request)

        } catch{
            print("Error fetching data \(error)")
        }
        
                    
     
    }
    
    func SaveItems(){
       
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
    }



}
