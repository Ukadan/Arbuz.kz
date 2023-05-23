//
//  UILabale+Ext.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
extension UILabel {
    
    
    convenience init(text: String?, font: UIFont, color: UIColor? = .black) {
        self.init()
        self.text = text
        self.backgroundColor = .clear
        self.font = font
        self.textColor = color
    }
}
