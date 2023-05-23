//
//  StackView+Ext.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
extension UIStackView {
    convenience init(_ axis: NSLayoutConstraint.Axis,
                     _ distribution:UIStackView.Distribution,
                     _ alignment: UIStackView.Alignment,
                     _ spacing: CGFloat,
                     _ arrangedSubviews: [UIView] ) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.backgroundColor = .clear
    }
    
    
    convenience init( axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat, views: [UIView]){
        self.init(arrangedSubviews: views)
        
        self.backgroundColor = .clear
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
}
