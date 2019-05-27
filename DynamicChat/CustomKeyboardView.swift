//
//  CustomKeyboardView.swift
//  DynamicChat
//
//  Created by Shubham Kapoor on 27/05/2019.
//  Copyright © 2019 Shubham Kapoor. All rights reserved.
//

import UIKit

class CustomKeyboardView: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.layer.cornerRadius = self.bounds.height/2
        self.clipsToBounds = true
        self.textColor = UIColor.black
        self.layer.borderColor = UIColor.black.cgColor
        self.setProperties(borderWidth: 1.0, borderColor:UIColor.black)
    }
    
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }

}
