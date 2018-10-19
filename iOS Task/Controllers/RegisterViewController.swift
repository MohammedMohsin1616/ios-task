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

        // Do any additional setup after loading the view.
    }
    @IBAction func registerButtonClicked(_ sender: Any) {
        
        
         Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (authResult, error) in
            // ...
            if error == nil && authResult != nil {
                
                print("Eshta")
                //self.performSegue(withIdentifier: "userPassedFromRegister", sender: nil)
            }
            else {
                print(error?.localizedDescription ?? "")
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
