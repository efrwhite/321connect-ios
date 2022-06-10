//
//  ProfilesViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/2/22.
//

import Foundation
import UIKit

class ProfileType {
    var profile: String?
    var name: [String]?
    
    init(profile: String, name: [String]){
        self.profile = profile
        self.name = name
    }
}

class ProfilesViewController: UIViewController /*UIViewController, UITableViewDelegate, UITableViewDataSource*/ {
    
    @IBOutlet weak var profilesTableView: UITableView!
    
    var profileType = [ProfileType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // hard code for debug ************************************************************
        profileType.append(ProfileType.init(profile: "Children", name: ["Edward", "Dallas"]))
        profileType.append(ProfileType.init(profile: "Parents/Caregivers", name: ["Jackson", "Charlotte"]))
        profileType.append(ProfileType.init(profile: "Providers", name: ["Brianna"]))
        // hard code for debug ************************************************************

    }
}
    
extension ProfilesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileType.count
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileType[section].name?.count ?? 0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profilesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = profileType[indexPath.section].name?[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return profileType[section].profile
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: profilesTableView.frame.width, height: 35))
        view.backgroundColor = .blue
        
        // header titles (for profile type)
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 35))
        label.text = profileType[section].profile
        view.addSubview(label)
        
        return view
    }
    
}
    
    /* * * * * * * * * * * * * * * * hard code * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        self.profilesTableView.delegate = self
//        self.profilesTableView.dataSource = self
//
//        self.profilesTableView.tableHeaderView = self.headerView()
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "Something"
//        return cell
//    }
//
//    private func headerView() -> UIView{
//        let view = UIView(frame: CGRect(x: 0,
//                                        y: 0,
//                                        width: self.profilesTableView.frame.width,
//                                        height: 50))
//        view.backgroundColor = .red
//
//        return view
//    }
//
//    private func footerView() -> UIView{
//        let view = UIView(frame: CGRect(x: 0,
//                                        y: 0,
//                                        width: self.profilesTableView.frame.width,
//                                        height: 50))
//        view.backgroundColor = .green
//
//        return view
//    }
//}
/* * * * * * * * * * * * * * * * hard code * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


/* * * * * * * * * * * * * * * * UI Builder * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
//
//extension ProfilesViewController: UITableViewDataSource, UITableViewDelegate{
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//}
/* * * * * * * * * * * * * * * * UI Builder * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


