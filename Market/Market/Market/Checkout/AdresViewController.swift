//
//  AdresViewController.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
class AdresViewController: UIViewController {
    let textField = UITextField()
    let textField2 = UITextField()
    private lazy var addressButton = UIButton()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addressButton.layer.cornerRadius = addressButton.frame.width / 2
        addressButton.clipsToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 25)
        textField.placeholder = "Адрес"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField2.textColor = .black
        
        textField2.font = .systemFont(ofSize: 25)
        textField2.placeholder = "Код от домофона"
        textField2.layer.borderColor = UIColor.black.cgColor
        textField2.layer.cornerRadius = 10
        textField2.clipsToBounds = true
        textField2.layer.borderWidth = 1
        textField2.keyboardType = .phonePad
        textField2.isSecureTextEntry = false
        
        addressButton.setTitle("ОК", for: .normal)
        addressButton.clipsToBounds = true
        addressButton.backgroundColor = .systemGreen
        addressButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchDown)
        
        setupView()
    }
    
    private func setupView() {
        view.addSubViews(textField, textField2, addressButton)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            textField2.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            textField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textField2.heightAnchor.constraint(equalToConstant: 50),
            
            addressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addressButton.heightAnchor.constraint(equalToConstant: 100),
            addressButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
