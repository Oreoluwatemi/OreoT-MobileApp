//
//  LoginViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-10.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var signinHeader: UIImageView!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passwordBtn: UITextField!
    
    @IBOutlet weak var signinBtn: UIButton!
    
    @IBOutlet weak var register: UIButton!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var nav: UINavigationItem!
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    var tabVC = TabViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.email.delegate = self
        self.passwordBtn.delegate = self
        applyPortraitConstraint()
        // Do any additional setup after loading the view.
    }
    
    
    func applyPortraitConstraint(){
        background.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false;
        header.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        header.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        header.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 9.0).isActive = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        header.layer.zPosition = 1

        background.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.0).isActive = true;
        background.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true;
        background.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1.0).isActive = true;
        background.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0).isActive = true;
        background.layer.zPosition = 0
        
        signinHeader.translatesAutoresizingMaskIntoConstraints = false;
        signinHeader.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        signinHeader.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true;
        signinHeader.topAnchor.constraint(equalToSystemSpacingBelow: header.topAnchor, multiplier: 30).isActive = true
        signinHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        signinHeader.layer.zPosition = 1
        
        email.translatesAutoresizingMaskIntoConstraints = false;
        email.layer.cornerRadius = 10.0
        email.layer.borderWidth = 1.5
        email.layer.borderColor = UIColor.black.cgColor
        email.textColor = .black
        email.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        email.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        email.topAnchor.constraint(equalToSystemSpacingBelow: signinHeader.topAnchor, multiplier: 10.0).isActive = true
        email.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        email.layer.zPosition = 1
        
        passwordBtn.translatesAutoresizingMaskIntoConstraints = false;
        passwordBtn.layer.cornerRadius = 10.0
        passwordBtn.layer.borderWidth = 1.5
        passwordBtn.layer.borderColor = UIColor.black.cgColor
        passwordBtn.textColor = .black
        passwordBtn.isSecureTextEntry = true
        passwordBtn.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        passwordBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        passwordBtn.topAnchor.constraint(equalToSystemSpacingBelow: email.topAnchor, multiplier: 10.0).isActive = true
        passwordBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        passwordBtn.layer.zPosition = 1
        
        signinBtn.translatesAutoresizingMaskIntoConstraints = false;
        signinBtn.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        signinBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        signinBtn.topAnchor.constraint(equalToSystemSpacingBelow: passwordBtn.topAnchor, multiplier: 12).isActive = true
        print(view.frame.height)
        signinBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        signinBtn.layer.zPosition = 1
//        signinBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        
        register.translatesAutoresizingMaskIntoConstraints = false;
        register.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        register.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        register.topAnchor.constraint(equalToSystemSpacingBelow: signinBtn.topAnchor, multiplier: 7.0).isActive = true
        print(view.frame.height)
        register.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        register.layer.zPosition = 1
    }
    
    @IBAction func cancelLogin(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func signin(_ sender: Any) {
        
        guard
        let emailField = email.text,
        let passwordField = passwordBtn.text,
        emailField.count > 0,
        passwordField.count > 0
        else {
            let alert = UIAlertController(title: "Login Failed", message: "Please fill all fields", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
            return
        }
        

    Auth.auth().signIn(withEmail: emailField, password: passwordField){
                user, error in
        if error == nil{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tabcontroller") as! TabViewController
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Login Failed", message: "Invalid Credientials", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
        }
            }
            
        
    }
    
    @IBAction func register(_ sender: Any) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
           return false
       }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "tab" {
//                    if let nextViewController = segue.destination as?
//                        TabViewController {
//
//                    }
//                }
//        if segue.identifier == "register"{
//            segue.destination as! RegisterViewController
//        }
//        }
    //    @objc func login(){
//        self.tabVC.modalPresentationStyle = .fullScreen
//        self.present(self.tabVC, animated: true)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "signin" {
//                if let nextViewController = segue.destination as?
//                    TabViewController {
//
//                }
//            }
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

