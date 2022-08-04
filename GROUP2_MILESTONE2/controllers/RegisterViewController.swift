//
//  RegisterViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-10.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var regHeader: UIImageView!
    
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var emailVal: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var confirmpassword: UITextField!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var signin: UIButton!
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var nav: UINavigationBar!
    
    let loginVC = LoginViewController()
    
    let userRef = Database.database().reference(withPath: "users")
    override func viewDidLoad() {
        super.viewDidLoad()
        applyPortraitConstraint()
        
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
        
        regHeader.translatesAutoresizingMaskIntoConstraints = false;
        regHeader.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        regHeader.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true;
        regHeader.topAnchor.constraint(equalToSystemSpacingBelow: header.topAnchor, multiplier: 20).isActive = true
        regHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        regHeader.layer.zPosition = 1

        firstname.translatesAutoresizingMaskIntoConstraints = false;
        firstname.layer.cornerRadius = 10.0
        firstname.layer.borderWidth = 1.5
        firstname.layer.borderColor = UIColor.black.cgColor
        firstname.textColor = .black
        firstname.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        firstname.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        firstname.topAnchor.constraint(equalToSystemSpacingBelow: regHeader.topAnchor, multiplier: 10).isActive = true
        firstname.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        firstname.layer.zPosition = 1

        lastname.translatesAutoresizingMaskIntoConstraints = false;
        lastname.layer.cornerRadius = 10.0
        lastname.layer.borderWidth = 1.5
        lastname.layer.borderColor = UIColor.black.cgColor
        lastname.textColor = .black
        lastname.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        lastname.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        lastname.topAnchor.constraint(equalToSystemSpacingBelow: firstname.topAnchor, multiplier: 7.0).isActive = true
        lastname.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        lastname.layer.zPosition = 1
        
        emailVal.translatesAutoresizingMaskIntoConstraints = false;
        emailVal.layer.cornerRadius = 10.0
        emailVal.layer.borderWidth = 1.5
        emailVal.layer.borderColor = UIColor.black.cgColor
        emailVal.textColor = .black
        emailVal.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        emailVal.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        emailVal.topAnchor.constraint(equalToSystemSpacingBelow: lastname.topAnchor, multiplier: 7.0).isActive = true
        emailVal.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        emailVal.layer.zPosition = 1
        
        passwordTxt.translatesAutoresizingMaskIntoConstraints = false;
        passwordTxt.layer.cornerRadius = 10.0
        passwordTxt.layer.borderWidth = 1.5
        passwordTxt.layer.borderColor = UIColor.black.cgColor
        passwordTxt.textColor = .black
        passwordTxt.isSecureTextEntry = true
        passwordTxt.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        passwordTxt.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        passwordTxt.topAnchor.constraint(equalToSystemSpacingBelow: emailVal.topAnchor, multiplier: 7.0).isActive = true
        passwordTxt.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        passwordTxt.layer.zPosition = 1
        
        confirmpassword.translatesAutoresizingMaskIntoConstraints = false;
        confirmpassword.layer.cornerRadius = 10.0
        confirmpassword.layer.borderWidth = 1.5
        confirmpassword.layer.borderColor = UIColor.black.cgColor
        confirmpassword.textColor = .black
        confirmpassword.isSecureTextEntry = true
        confirmpassword.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        confirmpassword.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        confirmpassword.topAnchor.constraint(equalToSystemSpacingBelow: passwordTxt.topAnchor, multiplier: 7.0).isActive = true
        confirmpassword.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        confirmpassword.layer.zPosition = 1
        

        registerBtn.translatesAutoresizingMaskIntoConstraints = false;
        registerBtn.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        registerBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        registerBtn.topAnchor.constraint(equalToSystemSpacingBelow: confirmpassword.topAnchor, multiplier: 15).isActive = true
        print(view.frame.height)
        registerBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        registerBtn.layer.zPosition = 1

        signin.translatesAutoresizingMaskIntoConstraints = false;
        signin.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        signin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        signin.topAnchor.constraint(equalToSystemSpacingBelow: registerBtn.topAnchor, multiplier: 5.5).isActive = true
        print(view.frame.height)
        signin.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        signin.layer.zPosition = 1
     
print("potrait")
    }
    

    @IBAction func cancelRegister(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func signinUser(_ sender: Any) {
    }
    @IBAction func registerUser(_ sender: Any) {
        var message = ""
        guard
            let firstname = firstname.text,
            let lastname = lastname.text,
            let email = emailVal.text,
            let passwordVal = passwordTxt.text,
            let cpassword = confirmpassword.text,
            firstname.count > 0,
            lastname.count > 0,
            passwordVal.count > 0,
            cpassword.count > 0,
            passwordVal == cpassword
   
        else {
    
            let alert = UIAlertController(title: "Registration Failed", message: "Please fill all fields", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
            return
        }
        
//        guard
//            let passwordVal = passwordTxt.text,
//            let cpassword = confirmpassword.text,
//              passwordVal == cpassword
//        else {
//            let alert = UIAlertController(title: "Registration Failed", message: "Password and Confirm Password do not match", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//
//            self.present(alert, animated: true)
//            return
//        }
//
        print("user input successful")
        Auth.auth().createUser(withEmail: email, password:  passwordVal) { user, error in
            //MARK: - If there is no error, perform a signIn using the Auth library signIn function
            if error == nil {
           
               let newUser = User(f:firstname, l:lastname, e:email)
                let userItemRef = self.userRef.child(Auth.auth().currentUser!.uid)

                print("user created")
                userItemRef.setValue(newUser.toAnyObject())
               // userItemRef.setValue(newUser)
                let alert = UIAlertController(title: "Registration Successful", message: "Click to Login", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { _ -> Void in
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "logincontroller") as! LoginViewController
                    self.present(nextViewController, animated: true, completion: nil)
                }))

                self.present(alert, animated: true)
                
                
            }
            else{
                print(error)
            }
            
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "signin"{
            segue.destination as! LoginViewController;
        }
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
//extension RegisterViewController: UITextFieldDelegate {
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//                
//        if textField == textFieldLoginEmail {
//            textFieldLoginPassword.becomeFirstResponder()
//        }
//        
//        if textField == textFieldLoginPassword {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
//}
