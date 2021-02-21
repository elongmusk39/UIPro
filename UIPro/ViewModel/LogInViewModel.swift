//
//  LogInViewModel.swift
//  UIPro
//
//  Created by Long Nguyen on 8/15/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

struct LogInViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        if email?.isEmpty == false && password?.isEmpty == false {
            return true
        } else {
            return false
        }
    }
    
    
}
