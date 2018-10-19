//
//  UIViewController.swift
//  iOS Task
//
//  Created by Mohammed Mohsin Sayed on 10/19/18.
//  Copyright © 2018 Mohammed Mohsin Sayed. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    // MARK: - show error message
    func showAlert(_ message: String){
        let alertController = UIAlertController(title: "Warnning", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertController , animated: true)
    }
    
    
    
}
