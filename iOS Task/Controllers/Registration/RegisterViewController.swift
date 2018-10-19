//
//  RegisterVC.swift
//  iOS Task
//
//  Created by Mohsin on 16.10.18.
//  Copyright © 2018 Mahmoud Omara. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        
        guard !(emailTextField.text?.isEmpty)! else {
            self.showAlert("Empty field! Please Enter a Valid Email Address")
            return
        }
        guard emailTextField.text?.isValidEmail() ?? false else {
            self.showAlert("Please Enter a Valid Email Address")
            return
        }
        guard !(passwordTextField.text?.isEmpty)! else {
            self.showAlert("Empty field! Please Enter a Valid Password")
            return
        }
        
        guard ((passwordTextField.text?.count)! >= 6) else {
            self.showAlert("The password must be 6 characters long or more.")
            return
            
        }
        
        guard (passwordTextField.text == confirmPasswordTF.text) else {
            self.showAlert("confirm password does not match password")
            return
            
        }
        
        self.startLoading()
        Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (authResult, error) in
            
            self.view.endEditing(true)
            self.stopLoading()
            if error == nil && authResult != nil {
                print("User has been created")
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                self.confirmPasswordTF.text = ""
                UserDefaults.standard.set(Auth.auth().currentUser?.email ?? "", forKey: "email")
                let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTableView") as! HomeTableView
                let nav = UINavigationController(rootViewController: viewController)
                self.present(nav , animated: true)
            }
            else {
                self.showAlert(error?.localizedDescription ?? "")
                
            }
        }
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
