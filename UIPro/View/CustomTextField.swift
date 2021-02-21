//
//  CustomTextView.swift
//  UIPro
//
//  Created by Long Nguyen on 8/14/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    
//MARK: - Scenes
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        //borderStyle = .bezel  //the border of the textField is a thin line
        //borderStyle = .line  //border is a solid line
        //borderStyle = .roundedRect  //the backgroundColor is white with little corner radius
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 18) //you can make it bold if needed
        textColor = .black
        //textAlignment = .left
        keyboardAppearance = .dark
        autocapitalizationType = .none
        
        //let's customize the placeHolder
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor.white])
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
