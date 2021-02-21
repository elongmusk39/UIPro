//
//  SignUpViewModel.swift
//  UIPro
//
//  Created by Long Nguyen on 8/15/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

struct SignUpViewModel {
    
    var email: String?
    var username: String?
    var password: String?
    
    var formIsvalid: Bool {
        if email?.isEmpty == false && username?.isEmpty == false && password?.isEmpty == false {
            return true
        } else {
            return false
        }
        
    }
    
    
    
}
