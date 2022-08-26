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

class ProfilesViewController: UIViewController {
    
    @IBOutlet weak var profilesTableView: UITableView!
    
    var profileType = [ProfileType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // ******************************** hard code for debug ********************************
        profileType.append(ProfileType.init(profile: "Children", name: ["Edward", "Dallas"]))
        profileType.append(ProfileType.init(profile: "Parents/Caregivers", name: ["Jackson", "Charlotte"]))
        profileType.append(ProfileType.init(profile: "Providers", name: ["Brianna"]))
        // ******************************** hard code for debug ********************************

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
}
    
extension ProfilesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // # 3 sections
        return profileType.count
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return profileType[section].name?.count ?? 0
        
    }
    
//    func someSegue() {
//        self.performSegue(withIdentifier: "showProvidersVC", sender: self)
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profilesTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.nameLabel.text = profileType[indexPath.section].name?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return profileType[section].profile
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as! ProfileHeaderView
        
        headerView.profileTitle.text = profileType[section].profile
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            self.performSegue(withIdentifier: "showChildVC", sender: tableView(_:didSelectRowAt:))
        case 1:
            self.performSegue(withIdentifier: "showParentsVC", sender: tableView(_:didSelectRowAt:))
        case 2:
            self.performSegue(withIdentifier: "showProvidersVC", sender: tableView(_:didSelectRowAt:))
        default:
            break
        }
    }
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "showChildVC" {
//
//            guard let data = sender as? String,
//                  let newViewController = segue.destination as? UIViewController else {
//                return
//            }
//
//            newViewController.data = data
//        }
    
}
    
