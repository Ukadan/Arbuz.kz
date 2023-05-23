//
//  DeliveryAddressView.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
final class DeliveryAddressView: UIView {
    
    private lazy var deliveryLabel = UILabel(text: "Выбрать адрес", font: .systemFont(ofSize: 12))
    lazy var deliveryButton = UIButton()
    private lazy var deliveryImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        lazy var leftStackvView = UIStackView(axis: .horizontal, distribution: .fill, spacing: 2, views: [deliveryImage, deliveryLabel])
        lazy var stackView = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 50, views: [leftStackvView, deliveryButton])
        self.addSubViews(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
        
    }
    
    private func setupView() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 22)
        deliveryButton.setImage(UIImage(systemName: "chevron.right", withConfiguration: configuration), for: .normal)
        deliveryButton.tintColor = .black
        
        deliveryImage.image = UIImage(systemName: "box.truck.badge.clock")
    }
}



