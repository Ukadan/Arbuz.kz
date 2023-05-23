//
//  CustomBackground.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
class PaddedLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width + 10, height: super.intrinsicContentSize.height)
    }
}
     class CustomBackground: UIView {
         
        convenience init(labelName: String) {
            self.init()

            let contentView = UIView()
            contentView.backgroundColor = .systemGray6
            contentView.layer.cornerRadius = 12
            contentView.layer.masksToBounds = true
            self.addSubViews(contentView)


            let label = PaddedLabel()
            label.text = labelName
            label.backgroundColor = .white
            label.font = .systemFont(ofSize: 18)
            label.textColor = .black
            label.textAlignment = .center

            self.addSubViews(label)
            
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: topAnchor),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
                contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -30),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            ])
        }
    }
