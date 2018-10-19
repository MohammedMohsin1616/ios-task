//
//  UIViewController.swift
//  iOS Task
//
//  Created by Mohammed Mohsin Sayed on 10/19/18.
//  Copyright © 2018 Mohammed Mohsin Sayed. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    // MARK: - show error message
    func showAlert(_ message: String){
        let alertController = UIAlertController(title: "Warnning", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertController , animated: true)
    }
    func startLoading()  {
        let size = CGSize(width: 50, height: 50)
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor.brown
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.startAnimating(size, message: "", type: NVActivityIndicatorType.ballGridPulse)
    }
    
    func stopLoading()  {
        self.stopAnimating()
    }
    
    
}
