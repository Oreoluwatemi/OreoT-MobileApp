//
//  SearchViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-18.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var titleHeader: UILabel!
    
    @IBOutlet weak var searchProduct: UISearchBar!
    
    @IBOutlet weak var myTableView: UITableView!
    
    let tableBox = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! SearchTableViewCell
        cell.nameLabel.text = "Ore"
      
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
