//
//  AccountViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-18.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var firstname: UILabel?
    @IBOutlet weak var titleHeader: UILabel?
    
    @IBOutlet weak var firstnameLabel: UILabel?
    
    @IBOutlet weak var lastname: UILabel?
    
    @IBOutlet weak var lastnameLabel: UILabel?
    
    @IBOutlet weak var email: UILabel?
    
    @IBOutlet weak var emailLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyPortraitConstraint()
        // Do any additional setup after loading the view.
    }
    func applyPortraitConstraint(){
        titleHeader!.translatesAutoresizingMaskIntoConstraints = false;
        titleHeader!.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 3).isActive = true;
        titleHeader!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        titleHeader!.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 7.0).isActive = true
        titleHeader!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        firstname!.translatesAutoresizingMaskIntoConstraints = false;
        firstname!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        firstname!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        firstname!.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20.0).isActive = true
        firstname!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        firstnameLabel!.translatesAutoresizingMaskIntoConstraints = false;
        firstnameLabel!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        firstnameLabel!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        firstnameLabel!.topAnchor.constraint(equalToSystemSpacingBelow:  firstname!.topAnchor, multiplier: 8.0).isActive = true
        firstnameLabel!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        firstnameLabel!.layer.cornerRadius = 15
        
        lastname!.translatesAutoresizingMaskIntoConstraints = false;
        lastname!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        lastname!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        lastname!.topAnchor.constraint(equalToSystemSpacingBelow: firstnameLabel!.topAnchor, multiplier: 15.0).isActive = true
        lastname!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        lastnameLabel!.translatesAutoresizingMaskIntoConstraints = false;
        lastnameLabel!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        lastnameLabel!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        lastnameLabel!.topAnchor.constraint(equalToSystemSpacingBelow:  lastname!.topAnchor, multiplier: 8.0).isActive = true
        lastnameLabel!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        lastnameLabel!.layer.cornerRadius = 15
        
        email!.translatesAutoresizingMaskIntoConstraints = false;
        email!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        email!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        email!.topAnchor.constraint(equalToSystemSpacingBelow: lastnameLabel!.topAnchor, multiplier: 15.0).isActive = true
        email!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        emailLabel!.translatesAutoresizingMaskIntoConstraints = false;
        emailLabel!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        emailLabel!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        emailLabel!.topAnchor.constraint(equalToSystemSpacingBelow:  email!.topAnchor, multiplier: 8.0).isActive = true
        emailLabel!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        emailLabel!.layer.cornerRadius = 15
        
        
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
