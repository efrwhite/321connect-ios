//
//  DevelopmentViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 2/4/22.
//

import Foundation
import UIKit

struct cellData {
    let section : String!
    let cellType : Int!
    let text : String!
}

class DevelopmentViewController: UIViewController {
    
    @IBOutlet weak var milestonesTableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    var cellArray = [cellData]()
    
    /* Table view arrays data */
    var sections = ["Physical",
                    "Fine Motor",
                    "Social",
                    "Verbal",
                    "Hearing",
                    "Notes"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellArray = [cellData(section: "Physical", cellType: 1, text: "Child first rolls over"),
                     cellData(section: "Physical", cellType: 1, text: "Child first sits up"),
                     cellData(section: "Physical", cellType: 1, text: "Child first crawls/creeps"),
                     cellData(section: "Physical", cellType: 1, text: "Child first pulls to standing"),
                     cellData(section: "Physical", cellType: 1, text: "Child first walks holding on"),
                     cellData(section: "Physical", cellType: 1, text: "Child first pulls without holding on"),
                     cellData(section: "Physical", cellType: 1, text: "Child first jumps"),
                     
                     cellData(section: "Fine Motor", cellType: 1, text: "Child first holds object"),
                     cellData(section: "Fine Motor", cellType: 1, text: "Child first hands to mouth"),
                     cellData(section: "Fine Motor", cellType: 1, text: "Child first passes object between hands"),
                     cellData(section: "Fine Motor", cellType: 1, text: "Child first uses pincer grasp (pick up small object with thumb and pointer finger"),
                     cellData(section: "Fine Motor", cellType: 1, text: "Child first drinks from a cup"),
                     cellData(section: "Fine Motor", cellType: 1, text: "Child first scribbles"),
                     cellData(section: "Fine Motor", cellType: 1, text: "Child first feeds self with spoon"),
                     
                     cellData(section: "Social", cellType: 1, text: "Child first points"),
                     cellData(section: "Social", cellType: 1, text: "Child first shows emotion"),
                     cellData(section: "Social", cellType: 1, text: "Child first shows affection"),
                     cellData(section: "Social", cellType: 1, text: "Child first interested and shows affection to other children"),
                     
                     cellData(section: "Verbal", cellType: 1, text: "Child first coos"),
                     cellData(section: "Verbal", cellType: 1, text: "Child first babbles"),
                     cellData(section: "Verbal", cellType: 1, text: "Child speaks first word"),
                     cellData(section: "Verbal", cellType: 1, text: "Child speaks first two word sentence"),
                     cellData(section: "Verbal", cellType: 1, text: "Child speaks first longer sentence"),

                     cellData(section: "Hearing", cellType: 1, text: "Child first startles"),
                     cellData(section: "Hearing", cellType: 1, text: "Child first turns toward sound"),
                     
                     cellData(section: "Notes", cellType: 2, text: "Enter notes"),
        ]
    }
}

//extension DevelopmentViewController: UITableViewDataSource, UITableViewDelegate{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cellArray[section].section.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = milestonesTableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
//
//        cell.textLabel?.text = cellArray.[indexPath.row].text
//    }
//
//}
