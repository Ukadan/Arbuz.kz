//
//  UIView+Ext.swift
//  Market
//
//  Created by macbook on 22.05.2023.
//

import UIKit
extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        })
    }
}
