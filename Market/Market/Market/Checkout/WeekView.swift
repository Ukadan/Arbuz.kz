//
//  WeekView.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
class WeekView: UIView {
    lazy var button = UIImageView()
    let configuration = UIImage.SymbolConfiguration(pointSize: 25)
    
    convenience init(labelName: String) {
        self.init()
        button.image = UIImage(systemName: "circle.fill", withConfiguration: configuration)
        button.tintColor = .white
        let label = UILabel(text: labelName, font: .systemFont(ofSize: 14), color: .gray)
        label.numberOfLines = 0
    
        let view = UIView()
        view.backgroundColor = .blue
        
        let stackView = UIStackView(.vertical, .equalCentering, .center, 5, [label, button])
        view.addSubViews(stackView)
        self.addSubViews(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
    }
    
    @objc func updateIsName() {
        if button.image == UIImage(systemName: "circle.fill", withConfiguration: configuration) {
            button.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: configuration)
            button.tintColor = .yellow
        } else {
            button.image = UIImage(systemName: "circle.fill", withConfiguration: configuration)
            button.tintColor = .yellow
        }
    }
}
