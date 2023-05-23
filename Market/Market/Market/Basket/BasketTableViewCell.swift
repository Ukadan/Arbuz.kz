//
//  BasketTableViewCell.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation
import UIKit

protocol BasketTableViewCellProtocol: AnyObject {
    func showAlert(message: String)
}


class BasketTableViewCell: UITableViewCell {
    
    weak var alertDelegate: BasketTableViewCellProtocol?
    
    private lazy var productImage = UIImageView()
    private lazy var nameProduct = UILabel()
    private lazy var countProduct = UILabel()
    private lazy var kilProduct = UILabel()
    private lazy var priceProductLabel = UILabel()
    private lazy var xMarkButton = UIButton()
    private lazy var plusButton = UIButton()
    private lazy var minusButton = UIButton()
    lazy var  buttonStackView = UIStackView(axis: .horizontal, distribution: .equalCentering, spacing: 5, views: [minusButton,countProduct,plusButton  ])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        let view = UIView()
        view.backgroundColor = .gray
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        xMarkButton.setImage(UIImage(systemName: "xmark", withConfiguration: configuration), for: .normal)
        xMarkButton.tintColor = .systemGray6
        
        priceProductLabel.frame = .init(x: 0, y: 0, width: 70, height: 50)
        countProduct.tintColor = .black
        nameProduct.numberOfLines = 2
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .black
        plusButton.tintColor = .black
        plusButton.addTarget(self, action: #selector(addActionPlus), for: .touchUpInside)
        
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = .black
        minusButton.tintColor = .black
        minusButton.addTarget(self, action: #selector(addActionMinus), for: .touchUpInside)
        
        buttonStackView.backgroundColor = .systemGray6
        buttonStackView.layer.cornerRadius = 5
        buttonStackView.clipsToBounds = true
        view.addSubViews(buttonStackView)
        
        lazy var  rightStackView = UIStackView(axis: .vertical, distribution: .equalSpacing, spacing: 25, views: [xMarkButton,priceProductLabel])
        lazy var  leftStackView = UIStackView(axis: .vertical, distribution: .equalSpacing, spacing: 25, views: [nameProduct,buttonStackView])
        lazy var  fullLeftStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 5, views: [productImage,leftStackView])
        lazy var  fullStackView = UIStackView(axis: .horizontal, distribution: .fill, spacing: 100, views: [fullLeftStackView,rightStackView])
        contentView.addSubViews(fullStackView)
        
        
        NSLayoutConstraint.activate([
            fullStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            fullStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fullStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            fullStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private var cont = ""
    private var priceProduct: Int = 0
    private var constant: Int = 0
    func configure(with model: BasketModel) {
        self.nameProduct.text = model.nameProduct
        self.productImage.image = UIImage(named: model.image ?? "")
        self.countProduct.text = model.countProduct
        self.priceProductLabel.text = model.price
        constant = Int(model.price.replacingOccurrences(of: cont, with: "")) ?? 0
        self.priceProduct = Int(model.price.replacingOccurrences(of: cont, with: "")) ?? 0
    }
    
    private func updateLabel() {
        if let kilText = countProduct.text {
            if let kilValue = Int(kilText) {
                countProduct.text = "\(kilValue + 1)"
                priceProduct += constant
            } else if let kilValue = Double(kilText.replacingOccurrences(of: "кг", with: "")) {
                let newValue = kilValue + 0.1
                
                if newValue >= 10.0 {
                    alertDelegate?.showAlert(message: "На складе нет такого количества товара")
                    return
                }
                
                countProduct.text = String(format: "%.1fкг", newValue)
                priceProduct += Int(constant)
            }
            
            priceProductLabel.text = String(priceProduct) + cont
            layoutIfNeeded()
        }
    }
    
    @objc func addActionPlus() {
        minusButton.isHidden = false
        buttonStackView.backgroundColor = .systemGreen
      
        updateLabel()
    }
    
    
    @objc func addActionMinus() {
        if let kilText = countProduct.text {
            if let kilValue = Int(kilText) {
                
                let newValue = kilValue - 1
                priceProduct -= constant
                if newValue <= 0 {
                    buttonStackView.backgroundColor = .systemGray6
                }
                countProduct.text = "\(max(newValue, 0))"
            } else if let kilValue = Double(kilText.replacingOccurrences(of: "кг", with: "")) {
                
                let newValue = kilValue - 0.1
                priceProduct -= Int(constant)
                if newValue <= 0 {
                    buttonStackView.backgroundColor = .systemGray6
                }
                countProduct.text = String(format: "%.1fкг", max(newValue, 0))
            }
            priceProductLabel.text = String(priceProduct) + cont
            layoutIfNeeded()
        }
    }
}
