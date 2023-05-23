//
//  PayViewcontroller.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
class PayViewcontroller: UIViewController {
    
    private lazy var checkoutButton = UIButton()
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            let labelWidth: CGFloat = 250
            let labelHeight: CGFloat = 50
            let spacing: CGFloat = 10
            let fontSize: CGFloat = 25
            
            checkoutButton.setTitle("Подтвердить подписку", for: .normal)
            checkoutButton.layer.cornerRadius = 20
            checkoutButton.clipsToBounds = true
            checkoutButton.backgroundColor = .systemGreen
            checkoutButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchDown)
            
            view.addSubViews(checkoutButton)
            let productsLabel = UILabel()
            productsLabel.text = "Продукты"
            productsLabel.textAlignment = .left
            productsLabel.font = UIFont.systemFont(ofSize: fontSize)
            view.addSubview(productsLabel)
            
            let productsValueLabel = UILabel()
            productsValueLabel.text = "100$"
            productsValueLabel.textAlignment = .right
            productsValueLabel.font = UIFont.systemFont(ofSize: fontSize)
            view.addSubview(productsValueLabel)
            
            let deliveryCostLabel = UILabel()
            deliveryCostLabel.text = "Стоимость доставки"
//            deliveryCostLabel.textAlignment = .left
            deliveryCostLabel.numberOfLines = 0
            deliveryCostLabel.font = UIFont.systemFont(ofSize: fontSize)
            view.addSubview(deliveryCostLabel)
            
            let deliveryCostValueLabel = UILabel()
            deliveryCostValueLabel.text = "5$"
            deliveryCostValueLabel.textAlignment = .right
            deliveryCostValueLabel.font = UIFont.systemFont(ofSize: fontSize)
            view.addSubview(deliveryCostValueLabel)
            
            let totalLabel = UILabel()
            totalLabel.text = "Итог"
            totalLabel.textAlignment = .left
            totalLabel.font = UIFont.systemFont(ofSize: fontSize)
            view.addSubview(totalLabel)
            
            let totalValueLabel = UILabel()
            totalValueLabel.text = "105$"
            totalValueLabel.textAlignment = .right
            totalValueLabel.font = UIFont.systemFont(ofSize: fontSize)
            view.addSubview(totalValueLabel)
            
            productsLabel.translatesAutoresizingMaskIntoConstraints = false
            productsValueLabel.translatesAutoresizingMaskIntoConstraints = false
            deliveryCostLabel.translatesAutoresizingMaskIntoConstraints = false
            deliveryCostValueLabel.translatesAutoresizingMaskIntoConstraints = false
            totalLabel.translatesAutoresizingMaskIntoConstraints = false
            totalValueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                productsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                productsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
                productsLabel.widthAnchor.constraint(equalToConstant: labelWidth),
                productsLabel.heightAnchor.constraint(equalToConstant: labelHeight),
                
                productsValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                productsValueLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
                productsValueLabel.widthAnchor.constraint(equalToConstant: labelWidth),
                productsValueLabel.heightAnchor.constraint(equalToConstant: labelHeight),
                
                deliveryCostLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                deliveryCostLabel.topAnchor.constraint(equalTo: productsLabel.bottomAnchor, constant: spacing),
                deliveryCostLabel.widthAnchor.constraint(equalToConstant: labelWidth),
                deliveryCostLabel.heightAnchor.constraint(equalToConstant: labelHeight),
                
                deliveryCostValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                deliveryCostValueLabel.topAnchor.constraint(equalTo: productsValueLabel.bottomAnchor, constant: spacing),
                deliveryCostValueLabel.widthAnchor.constraint(equalToConstant: labelWidth),
                deliveryCostValueLabel.heightAnchor.constraint(equalToConstant: labelHeight),
                
                totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                totalLabel.topAnchor.constraint(equalTo: deliveryCostLabel.bottomAnchor, constant: spacing),
                totalLabel.widthAnchor.constraint(equalToConstant: labelWidth),
                totalLabel.heightAnchor.constraint(equalToConstant: labelHeight),
                
                totalValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                totalValueLabel.topAnchor.constraint(equalTo: deliveryCostValueLabel.bottomAnchor, constant:spacing),
                totalValueLabel.widthAnchor.constraint(equalToConstant: labelWidth),
                totalValueLabel.heightAnchor.constraint(equalToConstant: labelHeight),
                
                checkoutButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10),
                checkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                checkoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
//                checkoutButton.heightAnchor.constraint(equalToConstant: 100),
                ])
                }


    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
