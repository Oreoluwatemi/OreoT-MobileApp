//
//  ViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var signin: UIButton!
    
    @IBOutlet weak var background: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        applyPortraitConstraint()
    }

    func applyPortraitConstraint(){
        background.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false;
        header.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        header.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        header.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5.0).isActive = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true

        background.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.0).isActive = true;
        background.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true;
        background.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1.0).isActive = true;
        background.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0).isActive = true;
        
        registerBtn.translatesAutoresizingMaskIntoConstraints = false;
        registerBtn.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        registerBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        registerBtn.topAnchor.constraint(equalToSystemSpacingBelow: header.topAnchor, multiplier: 70).isActive = true
        registerBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13).isActive = true

        signin.translatesAutoresizingMaskIntoConstraints = false;
        signin.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        signin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        signin.topAnchor.constraint(equalToSystemSpacingBelow: registerBtn.topAnchor, multiplier: 10).isActive = true
        print(view.frame.height)
        signin.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
     
print("potrait")
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "register" {
                if let nextViewController = segue.destination as?
                    RegisterViewController {
                   
                }
            }
        else if segue.identifier == "login" {
            if let nextViewController = segue.destination as?
                LoginViewController {
               
            }
        }
    }
}

    




