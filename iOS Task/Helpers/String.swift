//
//  String.swift
//  iOS Task
//
//  Created by Mohammed Mohsin Sayed on 10/19/18.
//  Copyright © 2018 Mohammed Mohsin Sayed. All rights reserved.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    
}
