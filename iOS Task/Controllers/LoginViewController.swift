//
//  ViewController.swift
//  iOS Task
//
//  Created by Mohsin on 16.10.18.
//  Copyright © 2018 Mahmoud Omara. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
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
        self.startLoading()
         Auth.auth().signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (user, error) in
            self.stopLoading()
            if error == nil && user != nil {
                print("User Login")
                let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTableView") as! HomeTableView
                let nav = UINavigationController(rootViewController: viewController)
                self.present(nav , animated: true)
            }else {
                self.showAlert(error?.localizedDescription ?? "")
            }
        }
        
    }
    
    
}

