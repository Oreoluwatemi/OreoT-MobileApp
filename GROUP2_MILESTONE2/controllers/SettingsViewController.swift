//
//  SettingsViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-18.
//

import UIKit

class SettingsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var titleHeader: UILabel!
    var accountVC = AccountViewController()
    let animals: [String] = ["Account", "Notification", "Logout"]
    @IBOutlet weak var settingTable: UITableView!
    var selectIndex = 0
    let cellSpacingHeight: CGFloat = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        settingTable.delegate = self
        settingTable.dataSource = self
       // self.accountTable.register(UITableViewCell.self, forCellReuseIdentifier: "accountcell")
   
        applyPortraitConstraint()
        // Do any additional setup after loading the view.
    }
    
    func applyPortraitConstraint(){
        titleHeader.translatesAutoresizingMaskIntoConstraints = false;
        titleHeader.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 3).isActive = true;
        titleHeader.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        titleHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5.0).isActive = true
        titleHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return self.animals.count
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingcell", for: indexPath) as! UITableViewCell
                // note that indexPath.section is used rather than indexPath.row
                cell.textLabel?.text = self.animals[indexPath.section]
                
                // add border and color
                
                cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor(red: 178/255.0, green: 189/255.0, blue: 214/255.0, alpha: 1.0).cgColor
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius = 8
                cell.clipsToBounds = true
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // note that indexPath.section is used rather than indexPath.row
        selectIndex = indexPath.section
        print(selectIndex)
            // Get the new view controller using segue.destination.
        if selectIndex == 0{
            let secondVC = storyboard?.instantiateViewController(withIdentifier: "AccountController") as! AccountViewController
            secondVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(secondVC, animated:true)
            
        }
        else if selectIndex == 1{
            let secondVC = storyboard?.instantiateViewController(withIdentifier: "NotificationController") as! NotificationViewController
            secondVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(secondVC, animated: true)
        }
     
        }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        if selectIndex == 0 {
//            let destination = segue.destination as! AccountViewController
//        } else if selectIndex == 1 {
//            let destination = segue.destination as! NotificationViewController
//        } else if selectIndex == 2 {
//            print("logout")
//        }
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
