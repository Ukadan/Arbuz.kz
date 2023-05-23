//
//  ContactView.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
class ContactView: UIView {
    let textField = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    
    convenience init(labelName: String, textContent1: String? = nil, textContent2: String? = nil, textContent3: String? = nil) {
        self.init()
        
        let contentView = UIView()
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        self.addSubViews(contentView)
        
        
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15)
        textField.placeholder = textContent1
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.borderWidth = 2
        textField.textAlignment = .justified
        textField2.textColor = .black
        
        textField2.font = .systemFont(ofSize: 15)
        textField2.placeholder = textContent2
        textField2.textAlignment = .justified
        textField2.layer.borderColor = UIColor.systemGray3.cgColor
        textField2.layer.cornerRadius = 10
        textField2.clipsToBounds = true
        textField2.layer.borderWidth = 2
        textField2.keyboardType = .phonePad
        textField2.isSecureTextEntry = false
        
        textField3.textColor = .black
        textField3.textAlignment = .justified
        textField3.font = .systemFont(ofSize: 15)
        textField3.placeholder = textContent3
        textField3.layer.borderColor = UIColor.systemGray3.cgColor
        textField3.layer.cornerRadius = 10
        textField3.clipsToBounds = true
        textField3.layer.borderWidth = 2
        
        contentView.addSubViews(textField, textField2, textField3)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            textField2.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            textField2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textField2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField2.heightAnchor.constraint(equalToConstant: 50),
            
            textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 5),
            textField3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textField3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField3.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            textField3.heightAnchor.constraint(equalToConstant: 50),
        ])
    
        
        self.addSubViews(contentView)
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        let label = PaddedLabel()
        label.text = labelName
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        
        self.addSubViews(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: -30).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
    }
}
