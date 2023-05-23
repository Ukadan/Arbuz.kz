//
//  RedmiView.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
class ReminderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func setupConstraints() {
     
        let buttonLabels = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        var buttons: [UIView] = []
        for (index, label) in buttonLabels.enumerated() {
        let button = WeekView(labelName: label)

            let view = UIView()
            button.tag = index + 1

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(appendAction(_:)))
            button.addGestureRecognizer(tapGesture)

            buttons.append(button)
        }
        
        lazy var buttonsStackvView = UIStackView(.horizontal, .fillProportionally, .center, 20, buttons)
        buttonsStackvView.backgroundColor = .yellow
        self.addSubViews(buttonsStackvView)
        
        NSLayoutConstraint.activate([
            buttonsStackvView.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor),
            buttonsStackvView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonsStackvView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonsStackvView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
    }
    
    @objc private func appendAction(_ gesture: UITapGestureRecognizer) {
        guard let button = gesture.view as? WeekView else {
            return
        }

        switch button.tag {
        case 1:
            button.updateIsName()
            break
        case 2:
            button.updateIsName()
            break
        case 3:
            button.updateIsName()
            break
        case 4:
            button.updateIsName()
            break
        case 5:
            button.updateIsName()
            break
        case 6:
            button.updateIsName()
            break
        case 7:
            button.updateIsName()
            break
        default:
            break
        }
    }
}
