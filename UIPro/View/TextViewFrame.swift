//
//  ThemeImageFrame.swift
//  UIPro
//
//  Created by Long Nguyen on 8/14/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class TextViewFrame: UIView {
    
    
    init(icon: UIImage? = UIImage(systemName: "paperplane"), textField: UITextField) {
        super.init(frame: .zero)
       
        setHeight(height: 50)
        
        let iv = UIImageView()
        iv.image = icon
        iv.tintColor = .white
        iv.alpha = 0.9
        
        addSubview(iv)
        iv.anchor(left: leftAnchor, paddingLeft: 4)
        iv.centerY(inView: self)
        iv.setDimensions(height: 24, width: 28)
        
        addSubview(textField)
        textField.anchor(left: iv.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 4)
        textField.centerY(inView: self)
        
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, paddingBottom: 4, height: 0.75)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
