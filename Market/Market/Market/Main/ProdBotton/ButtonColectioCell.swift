//
//  ButtonColectioCell.swift
//  Market
//
//  Created by macbook on 20.05.2023.
//

import UIKit
class ButtonColectioCell: UICollectionViewCell {
    
    lazy var imageCell : UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    private lazy var countProduct = UILabel()
    private lazy var kilProduct = UILabel()
    private lazy var plusButton = UIButton()
    private lazy var minusButton = UIButton()
    private let label = UILabel()
    private lazy var buttonStackView = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 1, views: [minusButton, countProduct, kilProduct, plusButton  ])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 10)
        updateLabel()
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .black
        plusButton.tintColor = .black
        plusButton.addTarget(self, action: #selector(addActionPlus), for: .touchUpInside)
        
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = .black
        minusButton.tintColor = .black
        minusButton.addTarget(self, action: #selector(addActionMinus), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        buttonStackView.backgroundColor = .systemGray6
        buttonStackView.layer.cornerRadius = 10
        buttonStackView.clipsToBounds = true
        
        minusButton.isHidden = true
        
        kilProduct.isHidden = true
        
        imageCell.layer.cornerRadius = 20
        imageCell.clipsToBounds = true
        
        let topView = UIView()
        topView.backgroundColor = .systemGray6
        let view = UIView()
        topView.layer.cornerRadius = 20
        topView.clipsToBounds = true
        
        
        contentView.addSubViews(view)
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        view.addSubViews(topView, label, buttonStackView)
        topView.addSubViews(imageCell)
        
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageCell.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            imageCell.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            imageCell.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            imageCell.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            
            label.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 10),
            
            buttonStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
        
    }
    
    var value: Double = 1.0
    func configure(model: ButtonModel) {
        imageCell.image = UIImage(named: model.imagename)
        label.text = model.title
        countProduct.text = model.count
        kilProduct.text = model.kil
    }
    
    func updateLabel() {
        if let kilText = kilProduct.text {
            if let kilValue = Int(kilText) {
                kilProduct.text = "\(kilValue + 1)"
            } else if let kilValue = Double(kilText.replacingOccurrences(of: "кг", with: "")) {
                let newValue = kilValue + 0.1
                kilProduct.text = String(format: "%.1fкг", newValue)
            }
            layoutIfNeeded()
        }
    }
    
    @objc func addActionPlus() {
        minusButton.isHidden = false
        kilProduct.isHidden = false
        countProduct.isHidden = true
        buttonStackView.backgroundColor = .systemGreen
        
        updateLabel()
    }
    
    
    @objc func addActionMinus() {
        if let kilText = kilProduct.text {
            if let kilValue = Int(kilText) {
                
                let newValue = kilValue - 1
                if newValue <= 0 {
                    minusButton.isHidden = true
                    kilProduct.isHidden = true
                    countProduct.isHidden = false
                    buttonStackView.backgroundColor = .systemGray6
                }
                kilProduct.text = "\(max(newValue, 0))"
            } else if let kilValue = Double(kilText.replacingOccurrences(of: "кг", with: "")) {
                
                let newValue = kilValue - 0.1
                if newValue <= 0 {
                    minusButton.isHidden = true
                    kilProduct.isHidden = true
                    countProduct.isHidden = false
                    buttonStackView.backgroundColor = .systemGray6
                }
                kilProduct.text = String(format: "%.1fкг", max(newValue, 0))
            }
            layoutIfNeeded()
        }
    }
}
